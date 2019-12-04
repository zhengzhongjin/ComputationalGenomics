shingleLen=10

for ((i = 0;i < 10;i++)) {
    mvn exec:java -Dexec.mainClass="Shingles.ShinglesTest" -Dexec.args="db.fa query_$i $shingleLen shingles_$((shingleLen))_$((i))"
}