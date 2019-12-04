rule target:
    input:
        expand("test/kbanded_{k}_{b}.result", k=range(1, 21), b=range(1, 16)),
        expand("test/shingles_{k}_{gramSize}.result", k=range(1, 21), gramSize=range(2, 21))

rule test:
    input:
        "test/{param}.params"
    output:
        "test/{param}.result"

    shell:
        "bash ./script.sh {input} {output}"
