
## tips

+ logr is a interface
+ zap is one of backends

+ `zap.Options{}` return a logger for production mode
    + defaults(encoder=jsonEncoder,logLevel=Info,stackTraceLevel=Error) Production mode
    + `--zap-devel` development mode
        + defaults(encoder=consoleEncoder,logLevel=Debug,stackTraceLevel=Warn) 
    + `--zap-encoder` json or console
    + `--zap-stacktrace-level` info or error

## cmd
+ `go run main.go`
+ `go run main.go --zap-log-level=debug`
+ `make run ARGS="--zap-encoder=console" ENABLE_WEBHOOKS=false`
    + 通过ARGS传参数

## sample code
```go
package main

import (
	"sigs.k8s.io/controller-runtime/pkg/log/zap"  
	logf "sigs.k8s.io/controller-runtime/pkg/log"
)

var globalLog = logf.Log.WithName("global")
func main() {
	// Add the zap logger flag set to the CLI. The flag set must
	// be added before calling flag.Parse().
	opts := zap.Options{}
	opts.BindFlags(flag.CommandLine)
	flag.Parse()

	logger := zap.New(zap.UseFlagOptions(&opts))
	logf.SetLogger(logger)

	scopedLog := logf.Log.WithName("scoped")

	globalLog.Info("Printing at INFO level")
	globalLog.V(1).Info("Printing at DEBUG level")
	scopedLog.Info("Printing at INFO level")
	scopedLog.V(1).Info("Printing at DEBUG level")
}
```
<!-- Custom zap logger  -->
```go
	import(
	...
	zaplogfmt "github.com/sykesm/zap-logfmt"
	uzap "go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	logf "sigs.k8s.io/controller-runtime/pkg/log"
	"sigs.k8s.io/controller-runtime/pkg/log/zap"
	...
)
	configLog := uzap.NewProductionEncoderConfig()
	configLog.EncodeTime = func(ts time.Time, encoder zapcore.PrimitiveArrayEncoder) {
		encoder.AppendString(ts.UTC().Format(time.RFC3339Nano))
	}
	logfmtEncoder := zaplogfmt.NewEncoder(configLog)

	// Construct a new logr.logger.
	logger := zap.New(zap.UseDevMode(true), zap.WriteTo(os.Stdout), zap.Encoder(logfmtEncoder))
	logf.SetLogger(logger)
```


## ref
+ [connect-sdk logging](https://sdk.operatorframework.io/docs/building-operators/golang/references/logging/)
+ [logr](https://godoc.org/github.com/go-logr/logr)
+ [zapr](https://godoc.org/github.com/go-logr/zapr)