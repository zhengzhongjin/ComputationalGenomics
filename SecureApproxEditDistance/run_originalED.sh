#!/bin/bash
# $1 : db file
# $2 : query file
# $3 : original result file

for ((i = 0;i < 10;i++)) {
    mvn exec:java -Dexec.mainClass="Accuracy.OriginalEditdistance" -Dexec.args="db.fa query_$i 30"
    cp original_results $3_$i
}