#!/bin/bash
# $1 db
# $2 query
# $3 python
# $4 org file
# $5 output name

# ./shingles_acc.sh ../db_cluster/db_cluster query.fa ./MapClusterToLabel_db.py db.fa db
# ./shingles_acc.sh ../db1_cluster/db1_cluster query1.1 ./MapClusterToLabel.py db1.fa db1

for ((g=2;g<=17;g+=2)) {
    echo "gram size = $g"
    echo "0 $g $g" > test.params
    ./accuracy_cluster.sh $1 $2 test.params result_$5_$g.txt $3 $4
}