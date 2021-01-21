
## start


+ `config/scorecard`
    + `operator-sdk init`生成kustomize files
    + `make bundle`会把这些文件加到bundle目录
    + `scorecard`命令会用到bundle文件夹里的test

+ `bundle/tests/scorecard/config.yaml`
    + 驱动test
    + `make bundle`生成
    + 修改会被下次`make bundle`覆盖，需要修改`config/scorecard`

## cmd
+ `operator-sdk scorecard <bundle_dir_or_image> [flags]`  run scorecard
    + `-l`,`--selector`
        + `operator-sdk scorecard <bundle_dir_or_image> -o text --selector=test=basic-check-spec-test`
        + `operator-sdk scorecard <bundle_dir_or_image> -o text --selector='test in (basic-check-spec-test,olm-bundle-validation-test)'`
    + `-o`,`--output`
        + `json`
        + `test`
    + `-c`, `--config`
        + 默认路径<bundle directory>/tests/scorecard/config.yaml
    + `-w`,`--wait-time`
        + `operator-sdk scorecard <bundle_dir_or_image> --selector=suite=custom -o json --wait-time=32s --skip-cleanup=false`
        + 超时时间,默认30s
    + `-x`,`--skip-cleanup`
        + `--skip-cleanup=false`
            + 测完后不清除资源
        + 一般用于debug
    + `-s`,`--service-account`
        + 指定sa,默认为default
    + `-n`,`--namespace`
        + 默认为default
        + `operator-sdk scorecard <bundle_dir_or_image> --namespace=mycustomns`
    + `--skip-cleanup=true` 不删除资源
    + `--verbose` Enable verbose logging


+ ` kustomize build config/scorecard > path/to/config.yaml` bundle之外生成
    + `make bundle`  bundle/tests/scorecard/config.yaml bundle内生成



## ref
+ [Scorecard](https://sdk.operatorframework.io/docs/advanced-topics/scorecard/scorecard/)
+ [operator-sdk scorecard](https://sdk.operatorframework.io/docs/cli/operator-sdk_scorecard/)

+ [Returning Multiple Test Results](https://github.com/operator-framework/api/blob/333d064/pkg/apis/scorecard/v1alpha3/test_types.go#L35)
+ [Accessing the Kube API](https://sdk.operatorframework.io/docs/advanced-topics/scorecard/custom-tests/)



<!-- sample -->
+ [ custom-scorecard-tests](https://github.com/operator-framework/operator-sdk/blob/09c3aa14625965af9f22f513cd5c891471dbded2/images/custom-scorecard-tests/main.go)
+ [basic test](https://github.com/operator-framework/operator-sdk/blob/09c3aa14625965af9f22f513cd5c891471dbded2/internal/scorecard/tests/basic.go)
+ [olm test](https://github.com/operator-framework/operator-sdk/blob/09c3aa14625965af9f22f513cd5c891471dbded2/internal/scorecard/tests/olm.go)
+ [bundle/tests/scorecard/config.yaml](https://github.com/operator-framework/operator-sdk/blob/09c3aa14625965af9f22f513cd5c891471dbded2/internal/scorecard/testdata/bundle/tests/scorecard/config.yaml)