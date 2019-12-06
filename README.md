# Computational Genomics

## Compile

```
cd ComputationalGenomics/SecureApproxEditDistance
mvn clean
mvn compile
```

## Run

### Accuracy & Efficiency
In the folder ComputationalGenomics, execute
```
snakemake
```

The accuracy result is in ComputationalGenomics/test/\*.acc, and efficiency result is in ComputationalGenomics/test/\*.result

### Result file format

- Accuracy : each .acc file contains 20 lines, the line number corresponds to the value $k$. 
The file name specifiies the method (shingles/kbanded) used, and the parameters ( gram size / banded value) of the protocol.

- Efficiency : each .result file contains the standard output when running the protocol, which contains the running time. 
The file name specifies the method (shingles/kbanded) used, and the k value for top-k query, and parameters ( gram size / banded value) of the protocol.

