#!/bin/bash
# $1 - parameter file
# $2 - result

#rm -rf SecureApproxEditDistance

rnd=$RANDOM
cp -r SecureApproxEditDistance SecureApproxEditDistance.$rnd

cd SecureApproxEditDistance.$rnd
(./run_server_cluster.sh db.fa ../$1 query.fa & ./run_researcher_cluster.sh db.fa ../$1 query.fa 127.0.0.1) >& stdout.result
cd ..
cp SecureApproxEditDistance.$rnd/stdout.result $2
rm -rf SecureApproxEditDistance.$rnd
