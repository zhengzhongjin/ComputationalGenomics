bandWidth=50

for ((i = 0;i < 10;i++)) {
    mvn exec:java -Dexec.mainClass="KBanded.KbandedAlignment" -Dexec.args="db.fa query_$i $bandWidth kbanded_$((bandWidth))_$((i))"
}