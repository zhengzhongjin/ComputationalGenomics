#!/bin/bash
# $1 : db
# $2 : query
# $3 : python
# $4 : org file
# $5 : output name

# ./kbanded_acc.sh ../db_cluster/db_cluster query.fa ./MapClusterToLabel_db.py db.fa db
# ./kbanded_acc.sh ../db1_cluster/db1_cluster query1.1 ./MapClusterToLabel.py db1.fa db1

for ((b=1;b<10;b+=2)) {
    echo "gram size = $b"
    echo "0 $b $b" > test.params
    ./accuracy_cluster_kband.sh $1 $2 test.params result_k_banded_$5_$b.txt $3 $4
}