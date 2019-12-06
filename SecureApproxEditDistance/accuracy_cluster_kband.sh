#!/bin/bash
# $1 : db file
# $2 : query file
# $3 : param file
# $4 : output file
# $5 : python mapping file
# $6 : org db file

echo "input = $1 $2 $3 $4 $5 $6"
line=($(<"$3"))
method=${line[0]}

org_db=$6

db_size=`wc -l $org_db | awk '{ print $1 }'`
query_size=`wc -l $2 | awk '{ print $1 }'`

db_size=$(($db_size/2))
query_size=$(($query_size/2))

rm -rf query_set
mkdir query_set

echo "db size, query size = $db_size, $query_size"
mvn exec:java -Dexec.mainClass="util.Split" -Dexec.args="$2 query_set/query"

for ((i=0;i<$query_size;i++)) {
    echo $i
    # Get original result
    mvn exec:java -Dexec.mainClass="Accuracy.OriginalEditdistance" -Dexec.args="$org_db query_set/query_$i 100000"
    mv original_results original_results_$i

    # Get method result
    #if [ "$method" == "0" ]; then # shingles
    param_b_1=${line[1]}
    mvn exec:java -Dexec.mainClass="KBanded.KbandedAlignment" -Dexec.args="$1 query_set/query_$i $param_b_1 layer_1_output"
    param_b_2=${line[2]}
    top1=`head -1 layer_1_output`
    top1=${top1:2}
    clusterLab=`$5 $top1`
    mvn exec:java -Dexec.mainClass="KBanded.KbandedAlignment" -Dexec.args="$1_$clusterLab query_set/query_$i $param_b_2 method_$i"
}

# Get accuracy
mvn exec:java -Dexec.mainClass="Accuracy.ErrorCalcStat" -Dexec.args="method $db_size $query_size $4"
