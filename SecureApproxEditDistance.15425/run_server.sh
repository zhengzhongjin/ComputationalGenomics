#!/bin/bash
# $1= db.fa file containing the database

echo $1
line=($(<"$1"))
method=line[0]
param_k=line[1]
port=line[3]

if [ "$method" == "0" ]; then
    gramSize=line[2]
    SECONDS=0
    mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idasht-ask2.PSI.PreProcessPSI" -Dexec.args="$1 $gramSize" 
	# we choose the OT type to be 0 (fastest)
    mvn exec:java -q  -Dexec.mainClass="cs.umanitoba.idashtask2.PSI.DataOwnerPSI" -Dexec.args="$1 $gramSize $port 0"
    duration=$SECONDS
    echo "PSI preprocessing duration: $duration s"
else 
	#KBanded alignment in Garbled Circuit
	#Preprocess the data for data owner and researcher
    param_b=line[2]	
	SECONDS=0
	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.PreProcessKBandedServer" -Dexec.args="$1 $port"
	mvn exec:java -Dexec.mainClass="cs.umanitoba.idashtask2.DataOwner $port $param_b" 
	#& sleep 1 & 	mvn exec:java -Dexec.mainClass="cs.umanitoba.idashtask2.Researcher" -Dexec.args="$2"
	duration=$SECONDS
	echo "kbanded preprocessing duration: $duration s"
fi
