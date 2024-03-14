## 以下是一个使用Nginx设置基本身份验证的示例：

### 安装Nginx并配置您的VitePress站点。

### 在Nginx的配置文件中添加以下内容：

```shell
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/.htpasswd;
        proxy_pass http://localhost:3000; # VitePress的默认端口
    }
}
```

使用htpasswd命令创建一个用户名和密码的文件，保存为/etc/nginx/.htpasswd。例如：

```shell
$ sudo htpasswd -c /etc/nginx/.htpasswd username
```
      
您将被提示输入密码。

4.重新启动Nginx服务。

现在，访问您的VitePress站点时，将会弹出基本身份验证对话框，要求输入用户名和密码才能访问。

请注意，这只是一种简单的方法，您可以根据需要进行更多的自定义和配置。同时，使用基本身份验证时，用户名和密码是以明文方式传输的，因此建议在使用HTTPS的情况下使用基本身份验证来提供安全性。