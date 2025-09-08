# Inner API

一个简单的 FastAPI 应用，提供 REST API 服务。

## 本地运行

+ `python main.py`
  + 访问 http://localhost:8000/inner

## Docker 部署

### 构建 Docker 镜像

```bash
# 在项目根目录下执行
docker build -t inner-api:latest .
```

### 运行 Docker 容器

```bash
docker run -d -p 8000:8000 --name inner-api-container inner-api:latest
```

访问 http://localhost:8000/inner 测试 API

## Kubernetes 部署

### 前提条件

- 已安装 kubectl 并配置好集群访问
- Docker 镜像已构建并可被 Kubernetes 集群访问

### 部署步骤

1. **如果使用本地镜像，需要将镜像推送到可被 K8s 访问的镜像仓库**

   ```bash
   docker run -d -p 5001:5000 --name registry registry:2
   # 标记镜像（替换 your-registry 为您的镜像仓库地址）
   docker tag inner-api:latest localhost:5001/inner-api:latest
   
   # 推送镜像
   docker push localhost:5001/inner-api:latest
   
   ```

2. **部署应用到 Kubernetes**

   ```bash
   # 创建 Deployment
   kubectl apply -f k8s-deployment.yaml -n test
   
   # 创建 Service
   kubectl apply -f k8s-service.yaml -n test
   ```

3. **验证部署**

   ```bash
   # 检查 Pod 状态
   kubectl get pods -l app=inner-api
   
   # 检查 Service 状态
   kubectl get svc inner-api-service
   ```

4. **访问服务**

   如果使用 ClusterIP（默认）:
   ```bash
   # 端口转发以访问服务
   kubectl port-forward svc/inner-api-service 8080:80
   ```
   然后访问 http://localhost:8080/inner

   如需从集群外部访问，可修改 k8s-service.yaml 将 type 改为 NodePort 或 LoadBalancer。

## 配置说明

- **Deployment**: 定义了 2 个副本，资源限制为每个 Pod 最多使用 0.5 CPU 和 256MB 内存
- **Service**: 创建一个集群内部服务，将容器的 8000 端口映射到服务的 80 端口