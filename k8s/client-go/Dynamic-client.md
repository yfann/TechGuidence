# Dynamic Client

+ access custom resources
+ k8s.io/client-go/dynamic
+ go type只有unstructured(json.Unmarshal)
```go
type Unstructured struct {
	// Object is a JSON compatible map with string, float, int, bool, []interface{}, or
	// map[string]interface{}
	// children.
	Object map[string]interface{}
}
```
+ 不用scheme和RESTMapper
    + 需要手动提供GVK

## code
<!-- 创建dynamic client -->
+ `client, err := NewForConfig(cfg)`

```go
client.Resource(gvr).
   Namespace(namespace).Get("foo", metav1.GetOptions{})
```