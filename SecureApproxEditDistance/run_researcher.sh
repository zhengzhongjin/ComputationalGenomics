#!/bin/bash
# $1= query.fa file containing the query
# $2 = param file
# $3 server/dataowner ip

#echo $1 $2 $3
line=($(<"$2"))
method=${line[0]}
param_k=${line[1]}
port=${line[3]}

if [ "$method" == "0" ]; then
	gramSize=${line[2]}
	SECONDS=0
	mvn exec:java -q  -Dexec.mainClass="cs.umanitoba.idashtask2.PSI.ResearcherPSI" -Dexec.args="$1 $param_k $3 $gramSize $port 0"
	duration=$SECONDS
	echo "PSI researcher duration : $duration s"
else 
	#KBanded alignment in Garbled Circuit
	#Preprocess the data for data owner and researcher
    param_b=${line[2]}
	SECONDS=0
	sleep 5
	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.PreProcessResearcher" -Dexec.args="$3 $port"
	mvn exec:java -q -Dexec.mainClass="cs.umanitoba.idashtask2.Researcher" -Dexec.args="$1 $3 $port $param_b"
	duration=$SECONDS
	echo "kBanded researcher duration : $duration s"
fi

#echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed for protocol $2."