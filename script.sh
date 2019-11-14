# $1 - configure file
# $2 - result

rm -rf SecureApproxEditDistance
cp -r fresh SecureApproxEditDistance

cp $1 SecureApproxEditDistance/Config.conf
cd SecureApproxEditDistance 
(./run_server.sh db1.fa 2 & ./run_researcher.sh query.fa 2 127.0.0.1 10) >& stdout.result
cd ..
cp SecureApproxEditDistance/stdout.result $2
