#!/bin/bash
# $1 : db file
# $2 : query file
# $3 : param file
# $4 : output file

line=($(<"$3"))
method=${line[0]}

rm -rf query_set
mkdir query_set

mvn exec:java -q -Dexec.mainClass="util.Split" -Dexec.args="$2 query_set/query"
db_size=`wc -l $1 | awk '{ print $1 }'`
query_size=`wc -l $2 | awk '{ print $1 }'`

db_size=$(($db_size/2))
query_size=$(($query_size/2))

#echo $db_size, $query_size

for ((i=0;i<$query_size;i++)) {
    # Get original result
    mvn exec:java -Dexec.mainClass="Accuracy.OriginalEditdistance" -Dexec.args="$1 query_set/query_$i 100"
    mv original_results original_results_$i

    # Get method result
    if [ "$method" == "0" ]; then # shingles
        gramSize=${line[2]}
        mvn exec:java -Dexec.mainClass="Shingles.ShinglesTest" -Dexec.args="$1 query_set/query_$i $gramSize method_$i"
    else # kbanded
        param_b=${line[2]}
        mvn exec:java -Dexec.mainClass="KBanded.KbandedAlignment" -Dexec.args="$1 query_set/query_$i $param_b method_$i"
    fi
}

# Get accuracy
mvn exec:java -Dexec.mainClass="Accuracy.ErrorCalcStat" -Dexec.args="method $db_size $query_size $4"
