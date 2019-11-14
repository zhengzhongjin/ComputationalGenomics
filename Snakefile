rule targets:
    input:
        "test/1.result",
        "test/2.result"

rule test:
    input:
        "test/{param}.conf"
    output:
        "test/{param}.result"
    shell:
        "bash ./script.sh {input} {output}"
