# ocelot config

## routes
<!-- catch all straight through -->
+ catch all
    + 优先级低(Priority:0)，可以被其他路由规则覆盖
```json
{
    "DownstreamPathTemplate": "/{url}",
    "DownstreamScheme": "https",
    "DownstreamHostAndPorts": [
            {
                "Host": "localhost",
                "Port": 80,
            }
        ],
    "UpstreamPathTemplate": "/{url}",
    "UpstreamHttpMethod": [ "Get" ]
}
```

+ `"UpstreamHost": "somedomain.com"`
    + 匹配hsot header

+ `"Priority": 0`
    + 0 is the lowest priority

+ query string
```json
{
    "DownstreamPathTemplate": "/api/subscriptions/{subscriptionId}/updates?unitId={unitId}",
    "UpstreamPathTemplate": "/api/units/{subscriptionId}/{unitId}/updates",
    ...
}
```
or
```json
{
    "DownstreamPathTemplate": "/api/units/{subscriptionId}/{unitId}/updates",
    "UpstreamPathTemplate": "/api/subscriptions/{subscriptionId}/updates?unitId={unitId}",
    ...
}
```

## tips
+ `"RouteIsCaseSensitive": true`
+ dynamic routing
    + service-discovery
+ QoSOptions


## ref
+ [sample config](https://github.com/ThreeMammals/Ocelot/blob/main/test/Ocelot.ManualTest/ocelot.json)
+ [configuration](https://ocelot.readthedocs.io/en/latest/features/configuration.html)
+ [routing](https://ocelot.readthedocs.io/en/latest/features/routing.html)