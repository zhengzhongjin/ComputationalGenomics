echo 'rule targets:
    input:' > Snakefile.head

#kbanded
for ((k=1;k<=20;k++)) {
    for ((b=1;b<=15;b++)) {
        echo "$k $b" > kbanded_$((k))_$((b)).params
	echo "        \"test/kbanded_$((k))_$((b)).result\"," >> Snakefile.head
    }
}

#shingles
for ((k=1;k<=20;k++)) {
    for ((gramSize=2;gramSize<=20;gramSize++)) {
        echo "$k $gramSize" > shingles_$((k))_$((gramSize)).params
	echo "        \"test/shingles_$((k))_$((gramSize)).result\"," >> Snakefile.head
    }
}

cp Snakefile.head ../Snakefile
cat Snakefile.tail >> ../Snakefile
