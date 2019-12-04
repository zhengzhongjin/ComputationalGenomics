echo 'rule targets:
    input:' > Snakefile.head

# content in .params files:
# method 0/1 : 0 - PSI, 1 - kband
# param_k : top-k value
# gramSize / param_b : depends on method
# port 

#kbanded
for ((k=1;k<=20;k++)) {
    for ((b=1;b<=15;b++)) {
        port=$(($k*16 + $b + 19571))
        echo "0 $k $b $port" > kbanded_$((k))_$((b)).params
	echo "        \"test/kbanded_$((k))_$((b)).result\"," >> Snakefile.head
    }
}

#shingles
for ((k=1;k<=20;k++)) {
    for ((gramSize=2;gramSize<=20;gramSize++)) {
        port=$(($k*21 + $gramSize + 39571))
        echo "1 $k $gramSize $port" > shingles_$((k))_$((gramSize)).params
	echo "        \"test/shingles_$((k))_$((gramSize)).result\"," >> Snakefile.head
    }
}

#cp Snakefile.head ../Snakefile
#cat Snakefile.tail >> ../Snakefile
