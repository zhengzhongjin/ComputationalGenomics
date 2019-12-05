#!/bin/bash
# $1 : input file
# $2 : output file

rnd=$RANDOM

echo "$1 $2" 
cp -r SecureApproxEditDistance SecureApproxEditDistance.$rnd
cd SecureApproxEditDistance.$rnd
./accuracy.sh db.fa query.fa ../$1 ../$2
cd ..
rm -rf SecureApproxEditDistance.$rnd