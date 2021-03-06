rule target:
    input:
    #    expand("test/kbanded_{k}_{b}.result", k=range(1, 11), b=range(1, 10, 2)),
    #    expand("test/shingles_{k}_{gramSize}.result", k=range(1, 11), gramSize=range(2, 21, 3)),
    #    expand("test/kbanded_{b}.acc", b=range(1, 10, 2)),
    #    expand("test/shingles_{gramSize}.acc", gramSize=range(2, 21, 3)),
        expand("test/kbanded_10_{b}.result.cluster", b=range(1, 10, 2)),
        expand("test/shingles_10_{gramSize}.result.cluster", gramSize=range(2, 21, 3)),

rule test:
    input:
        "test/{param}.params"
    output:
        "test/{param}.result"
    shell:
        "./script.sh {input} {output}"

rule accuracy:
    input:
        "test/{param}.acc.params"
    output:
        "test/{param}.acc"
    shell:
        "./accuracy_wrapper.sh {input} {output}"

rule cluster:
    input:
        "test/{param}.params"
    output:
        "test/{param}.result.cluster"
    shell:
        "./script_cluster.sh {input} {output}"
