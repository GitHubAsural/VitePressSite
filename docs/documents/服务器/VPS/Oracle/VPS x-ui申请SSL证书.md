# VPS x-ui申请SSL证书

> [用docker创建nginx，自动申请免费的域名证书，并且配置重定向或反向代理](https://kejilion.blogspot.com/2023/02/dockernginx.html "用docker创建nginx，自动申请免费的域名证书，并且配置重定向或反向代理")
>
> -   例如：tag.soloasural.eu.org
>     ```bash
>     mkdir -p /etc/nginx/cert/eleadmin.soloasural.eu.org && chmod -R 755 /etc/nginx/cert/eleadmin.soloasural.eu.org
>
>
>     ~/.acme.sh/acme.sh --register-account -m SoloAsural@gmail.com
>
>
>     ~/.acme.sh/acme.sh --issue -d eleadmin.soloasural.eu.org --standalone
>
>
>     ~/.acme.sh/acme.sh --installcert -d eleadmin.soloasural.eu.org --key-file /etc/nginx/cert/eleadmin.soloasural.eu.org/key.pem --fullchain-file /etc/nginx/cert/eleadmin.soloasural.eu.org/cert.pem
>
>     ```
