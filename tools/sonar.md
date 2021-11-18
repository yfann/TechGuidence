


## properties
```
<!-- sonar-project.properties -->

sonar.projectKey=com.philips.hsc-vault-operator
sonar.projectName=hsc-vault-operator

sonar.sources=.
sonar.exclusions=**/*_test.go,**/test/**

sonar.tests=.
sonar.test.inclusions=**/*_test.go,**/test/**
<!-- 设置ut覆盖率 -->
<!-- go test ./... -coverprofile cover.out -->
sonar.go.coverage.reportPaths=cover.out
```

## ref
+ [install sonar](https://docs.sonarqube.org/latest/setup/install-server/)
+ [使用Sonar分析Golang代码](https://blog.csdn.net/lissdy/article/details/104802064)
+ [SonarScanner](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)