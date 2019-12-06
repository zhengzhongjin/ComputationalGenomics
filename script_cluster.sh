#!/bin/bash
# $1 - parameter file
# $2 - result

#rm -rf SecureApproxEditDistance

rnd=$RANDOM
cp -r SecureApproxEditDistance SecureApproxEditDistance.$rnd

cd SecureApproxEditDistance.$rnd
(./run_server_cluster.sh ../db_cluster/db_cluster ../$1 query.fa.1 & ./run_researcher_cluster.sh query.fa.1 ../$1 127.0.0.1 ../db_cluster/db_cluster) >& stdout.result
cd ..
cp SecureApproxEditDistance.$rnd/stdout.result $2
rm -rf SecureApproxEditDistance.$rnd
