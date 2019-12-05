#!/bin/bash
# $1 : input file
# $2 : output file

rnd=$RANDOM

db="db1_cluster.fa"
query="db1_query.fa"
clusterNum=5

echo "$1 $2"
cp -r SecureApproxEditDistance SecureApproxEditDistance.$rnd
cd SecureApproxEditDistance.$rnd
./accuracy_cluster.sh $db $query ../$1 ../$2
cd ..
rm -rf SecureApproxEditDistance.$rnd