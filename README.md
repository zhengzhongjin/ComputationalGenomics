# Computational Genomics


[*] Install CD-HIT

***
This project spins up a local server on the machine to simulate SPQ from client (doctor) to server (database/hospital)
***

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

* Shingle-based Protocol on 50-sequences Database

  In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
  ```
  ./shingles_acc.sh ../db_cluster/db_cluster query.fa ./MapClusterToLabel_db.py db.fa db
  ```

  The result is in `result_db_{2,4,...16}.txt`.

* Shingle-based Protocol on 500-sequences database
  
  In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
  ```
  ./shingles_acc.sh ../db1_cluster/db1_cluster query1.1 ./MapClusterToLabel.py db1.fa db1
  ```

  The result is in `result_db1_{2,4,...16}.txt`.

* Kbanded-based Protocol on 50-sequences database

  In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
  ```
  ./kbanded_acc.sh ../db_cluster/db_cluster query.fa ./MapClusterToLabel_db.py db.fa db
  ```
    
  The result is in `result_k_banded_db_{1,3,5,7,9}.txt`.

* Kbanded-based Protocol on 500-sequences database

  In the folder `ComputationalGenomics/SecureApproxEditDistance`, execute
  ```
  ./shingles_acc.sh ../db1_cluster/db1_cluster query1.1 ./MapClusterToLabel.py db1.fa db1
  ```
  
  The result is in `result_k_banded_db1_{1,3,5,7,9}.txt`.

The script will print the result to the standard output and the file `stdout` in the current folder.

***

[*]
In the cdhit-master folder, use the makefile command to make the executables and execute the following commands on gradx cluster.

./cd-hit-est -i db.fa -o db_cluster.fa -T 12 -M 1024

./cd-hit-est -i db1.fa -o db1_cluster.fa -T 12 -M 1024 -c 0.875 -n 6

***
Further, our testing results can be found in the test/ folder of which the `genParams.sh` script will run testing.

