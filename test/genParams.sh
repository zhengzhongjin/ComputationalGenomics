#!/bin/bash
echo 'rule targets:
    input:' > Snakefile.head

# content in .params files:
# method 0/1 : 0 - PSI, 1 - kband
# param_k : top-k value
# gramSize / param_b : depends on method
# port 

#shingles
for ((k=1;k<=20;k++)) {
    for ((gramSize=2;gramSize<=20;gramSize++)) {
        port=$(($k*21*2 + $gramSize*2 + 39571))
        echo "0 $k $gramSize $port" > shingles_$((k))_$((gramSize)).params
    }
}

#kbanded
for ((k=1;k<=20;k++)) {
    for ((b=1;b<=15;b++)) {
        port=$(($k*16*2 + $b*2 + 1 + 19571))
        echo "1 $k $b $port" > kbanded_$((k))_$((b)).params
    }
}

### Efficiency

#shingles
for ((gramSize=2;gramSize<=20;gramSize++)) {
    echo "0 $gramSize" > shingles_$((gramSize)).acc.params
}

#kbanded
for ((b=1;b<=15;b++)) {
    echo "1 $b" > kbanded_$((b)).acc.params
}

#cp Snakefile.head ../Snakefile
#cat Snakefile.tail >> ../Snakefile
