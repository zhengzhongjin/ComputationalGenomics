# Computational Genomics

## Compile

### Compile the PSI project
This project uses PSI project directly.
``` 
cd ComputationalGenomics/SecureApproxEditDistance/PSI
make clean
make
```

Copy executable file to the folder `SecureApproxEditDistance`. Specifically, in the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
``` 
cp PSI/*.exe ./
```

Add executable permission to all bash scripts.
In the folder `ComputationalGenomics` and `ComputationalGenomics/SecureApproxEditDistance`, execute
```
chmod +x *.sh
chmod +x *.py
```

### Compile the Java code
```
cd ComputationalGenomics/SecureApproxEditDistance
mvn clean
mvn compile
```

## Parameter Tuning for Previous Works

### Accuracy & Efficiency
In the folder `ComputationalGenomics`, execute
```
snakemake
```

The accuracy result is in `ComputationalGenomics/test/*.acc`, and efficiency result is in `ComputationalGenomics/test/*.result`

If you want to generate the `*.acc` and `*.result` on your own, delete them before you snakemake:
```
rm -rf test/*.result
rm -rf test/*.acc
```

### Result file format

- Accuracy : each `.acc` file contains 20 lines, the line number corresponds to the value $k$. 
The file name specifiies the method ( shingles / kbanded ) used, and the parameters ( gram size / banded value ) of the protocol.

- Efficiency : each `.result` file contains the standard output when running the protocol, which contains the running time. 
The file name specifies the method ( shingles / kbanded ) used, and the k value for top-k query, and parameters ( gram size / banded value ) of the protocol.

## Our Protocol: Hierarchical Clustering
The accuracy of our protocol is obtained by the following command.

- Shingle-based Protocol on 50-sequences Database
In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
```
./accuracy_cluster.sh ../db_cluster/db_cluster query.fa test.params stdout
```

- Shingle-based Protocol on 500-sequences database
Change the `.py` file on line 38 in `ComputationalGenomics/SecureApproxEditDistance/accuracy_cluster.sh` to `./MapClusterToLabel.py`.
In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
```
./accuracy_cluster.sh ../db1_cluster/db1_cluster query1.1 test.params stdout
```

- Kbanded-based Protocol on 50-sequences database
In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
```
./accuracy_wrapper_kband.sh db_cluster/db_cluster query.fa test.params stdout
```

- Kbanded-based Protocol on 500-sequences database
Change the `.py` file on line 37 in `ComputationalGenomics/SecureApproxEditDistance/accuracy_cluster_kband.sh` to `./MapClusterToLabel.py`.
In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
```
./accuracy_wrapper_kband.sh db1_cluster/db1_cluster query1.1 test.params stdout
```

The script will print the result to the standard output and the file `stdout` in the current folder.