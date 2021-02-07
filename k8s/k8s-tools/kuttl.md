# Kuttl

## install kuttl
+ https://github.com/kudobuilder/kuttl/releases
    + kubectl-kuttl_0.8.0_linux_x86_64
+ sudo chmod +x kubectl-kuttl_0.8.0_linux_x86_64
+ sudo mv kubectl-kuttl_0.8.0_linux_x86_64 /usr/local/bin/kubectl-kuttl
+ `kubectl kuttl version`

## cmd
+ `kubectl kuttl version`
+ `kubectl kuttl test --help`

+ `kubectl kuttl test` run at Test Suite Configuration's location
    + `kubectl kuttl test --start-kind=true <test suit dir>`
        +  ./tests/e2e/  test suit dir
        + ./tests/e2e/example-test  test case dir
    + `-n` namespace
    + `--help`

+ ` kubectl-kuttl test ./bundle/tests/scorecard/kuttl --report=JSON --artifacts-dir=./tmp`
    + `./tmp/kuttl-test.json` 生成报告
    
## sample
+ `kubectl-kuttl test ./bundle/tests/scorecard/kuttl --config=./bundle/tests/scorecard/kuttl/kuttl-test.yaml --namespace=alicloud-operators --report=JSON --artifacts-dir=/tmp > /tmp/kuttl.stdout 2> /tmp/kuttl.stderr`


## tips


## ref
+ [kuttl](https://kuttl.dev/docs/#pre-requisites)
<!-- install -->
+ [releases](https://github.com/kudobuilder/kuttl/releases)

+ [kubectl 备忘单](https://kubernetes.io/zh/docs/reference/kubectl/cheatsheet/)