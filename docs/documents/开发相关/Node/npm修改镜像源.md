二、修改成淘宝镜像源
1. 命令

npm config set registry https://registry.npmmirror.com

2. 验证命令

npm config get registry

如果返回https://registry.npmmirror.com，说明镜像配置成功。
