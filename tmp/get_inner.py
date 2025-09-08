from kubernetes import client, config
import logging, http.client
import os

http.client.HTTPConnection.debuglevel = 1
logging.basicConfig(level=logging.DEBUG)
# 如果在集群外，可以直接加载本地 kubeconfig
# config.load_kube_config()
# 如果在 Pod 内，可以用：
# config.load_incluster_config()
# 手动配置（用 token 方式）

token="eyJhbGciOiJSUzI1NiIsImtpZCI6IjFIQjZyb2VBVGlvQlRmeU5FbjRiT0NEUU1RTWxnN3ZfUzZoOFV2SmU2NmsifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNzU3MzQyMDEzLCJpYXQiOjE3NTczMzg0MTMsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwianRpIjoiZmM0Y2Q2N2YtYzA2Mi00MTg2LTgyZTQtMGQ2N2NmMDAyOWFkIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJteS1hZG1pbiIsInVpZCI6IjQwYWNlZDlmLTY0NjgtNDBjMi1hZjdkLWRmYWY0MGMzZDE2YSJ9fSwibmJmIjoxNzU3MzM4NDEzLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06bXktYWRtaW4ifQ.K082wbXmFNMR6DHpYxaGeKohz0asrq1oMkEN66GcyV2Q81zG96fMAypOTTSBM_eQSXa3FdrLsqf2Shi7BNO24GlFzPDAaV0o_BPqnSo6vMxFN4w-PLShZVcIWzmdPmop4y-UIQgAMviQFR98QIoJS2Zwxdza6UxgZmYNp2WaIMSJ-wf4-hDwDO1KKHSI0AqqIFMQ9k4xxDKiHTqNexVRyzhW7Szo0q-5bxfwKOW1MPy9v0PsKwjYnqJNwlrrvkXcBzKZI0UFLLLBz-tGrz6rfdfa-JdXwMpK9XnIxXQYt1RzDcT_K6qlzkioL1Bc-K3qls-y5SmdvrDsezGbHMUftQ"
namespace = "test"
service_name = "inner-api-service"
path = "inner"

try:
    # ----------------------------
    # 3. 初始化 CoreV1Api
    # ----------------------------
    print("Creating API client")
    configuration = client.Configuration()
    configuration.host = "https://127.0.0.1:61057"
    
    # CA证书配置方式有三种：
    # 1. 使用系统默认CA证书（推荐，安全）
    configuration.verify_ssl = True
    
    # 2. 关闭SSL验证（不推荐，不安全，仅用于测试）
    # configuration.verify_ssl = False
    
    # 3. 指定自定义CA证书文件（推荐，用于自签名证书）
    # 获取kubeconfig中的CA证书路径

    ca_cert_path = os.path.expanduser("~/.kube/ca.crt")  # 替换为实际CA证书路径
    configuration.ssl_ca_cert = ca_cert_path
    configuration.tls_server_name ="localhost"
    # 用 api_key 方式封装 token
    configuration.api_key = {"authorization": "Bearer " + token}
    # 生成 API 客户端
    api_client = client.ApiClient(configuration)
    # 调用核心 API
    v1 = client.CoreV1Api(api_client)
    

        
    response = v1.connect_get_namespaced_service_proxy_with_path(
        name=service_name,
        namespace=namespace,
        path=path
    )
    print(response)
    
except Exception as ex:
    print("❌ 获取命名空间时出错:", ex)