#!/bin/bash
# $1 - parameter file
# $2 - result

#rm -rf SecureApproxEditDistance

rnd=$RANDOM
cp -r SecureApproxEditDistance SecureApproxEditDistance.$rnd

cd SecureApproxEditDistance.$rnd
(./run_server.sh db1.fa ../$1 & ./run_researcher.sh query.fa ../$1 127.0.0.1) >& stdout.result
cd ..
cp SecureApproxEditDistance.$rnd/stdout.result $2
rm -rf SecureApproxEditDistance.$rnd
