
## issues

+ hypen issues
    + `{{.NetworkSettings.Networks.my-multihost-network.IPAddress}}`
    + `{{ $network := index .NetworkSettings.Networks "my-multihost-network" }}{{ $network.IPAddress}}`

## ref
+ [template](https://golang.org/pkg/text/template/)