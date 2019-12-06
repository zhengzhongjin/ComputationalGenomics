#!/bin/bash
# $1 : db file
# $2 : params file
# $3 : query file

# ./run_server_cluster.sh ../db_cluster/db_cluster ../test/kbanded_5_3.params query.fa
# ./run_server_cluster.sh ../db_cluster/db_cluster ../test/shingles_5_3.params query.fa

echo $2
line=($(<"$2"))
method=${line[0]}
param_k=${line[1]}
port=${line[3]}

echo $method $param_k $port

if [ "$method" == "0" ]; then
    gramSize=${line[2]}
    SECONDS=0
    mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.PSI.PreProcessPSI" -Dexec.args="$1 $gramSize" 
	# we choose the OT type to be 0 (fastest)
    mvn exec:java -q  -Dexec.mainClass="cs.umanitoba.idashtask2.PSI.DataOwnerPSI" -Dexec.args="$1 $port $gramSize 0"
    duration=$SECONDS

	# I'm researcher now
	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.PSI.ResearcherPSI" -Dexec.args="$3 $param_k $3 $gramSize $port 0"

    echo "PSI preprocessing duration: $duration s"
else 
	#KBanded alignment in Garbled Circuit
	#Preprocess the data for data owner and researcher
    param_b=${line[2]}
	SECONDS=0
	mvn -e exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.PreProcessKBandedServer" -Dexec.args="$1 $port"
	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.DataOwner" -Dexec.args="$port $param_b" 

	# I'm still server
	top1=`head -1 Results_KBandedEditDistance.txt`
    top1=${top1:2}
	clusterLab=`./MapClusterToLabel_db.py $top1`
	echo "cluster lab = $clusterLab"

	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.PreProcessKBandedServer" -Dexec.args="$1_$clusterLab $port"
	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.DataOwner" -Dexec.args="$port $param_b" 

	duration=$SECONDS
	echo "kbanded preprocessing duration: $duration s"
fi
