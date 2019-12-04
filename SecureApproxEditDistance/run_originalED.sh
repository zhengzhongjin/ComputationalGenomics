for ((i = 0;i < 10;i++)) {
    mvn exec:java -Dexec.mainClass="Accuracy.OriginalEditdistance" -Dexec.args="db.fa query_$i 30"
    cp original_results original_results_$i
}