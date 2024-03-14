# Docker项目脚本

> 1\. docker 操作命令
>
> -
>
> <!---->
>
>     安装 docker-compose
>
> <!---->
>
>     ```bash
>     sudo apt  install -y docker-compose
>     ```
>     或者
>     ```bash
>     wget -qO- get.docker.com | bash
>     ```
>     系统默认开机启动
>     ```bash
>     systemctl start docker
>     ```
>     杀死运行的容器：
>     ```bash
>     docker kill $(docker ps -a -q)
>     ```
>     删除所有容器：
>     ```bash
>     docker rm $(docker ps -a -q)
>     ```
>     强制删除所有镜像：
>     ```bash
>     docker rmi -f $(docker images -q)
>     ```
>     一条命令实现停用并删除容器：
>     ```bash
>     docker stop $(docker ps -q) & docker rm $(docker ps -aq)
>     ```
>
> > " 退出docker容器 "  C**trl+P+** Q

> 2\. Docker面板管理
>
> -   Docker面板添加多台主机容器
>     ```bash
>     mkdir -p /datadisk/DockerProjects/DockerPortainerPanel && cd /datadisk/DockerProjects/DockerPortainerPanel 创建项目相关文件夹👆
>     ```
>     ```bash
>     docker run -d -p 8000:8000 -p 9000:9000 --name DockerPortainerPanel --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /datadisk/DockerProjects/DockerPortainerPanel/data:/data portainer/portainer-ce:latest 创建docker容器👆
>     ```
>
> > 详细操作
> >
> > -   1\. 添加端口
> >
> >     vim  /usr/lib/systemd/system/docker.service
> >
> >     ExecStart=/usr/bin/dockerd -H tcp\://0.0.0.0:2375 -H fd:// --containerd=/run/containerd/containerd.sock
> >
> >     2\. 修改完之后保存文件，然后重启docker服务
> >     ```bash
> >     systemctl daemon-reload
> >     systemctl restart docker
> >
> >     ```
> >     3\. 路径：
> >
> >     Environments  →  Add Environments  →  Docker →  Start  →  API  →   "[nginx.soloasural.ml:2375](http://nginx.soloasural.ml:2375 "nginx.soloasural.ml:2375")"

> 3\. Mysql
>
> -   详细操作
>     1.  创建文件夹
>         ```bash
>         mkdir -p /datadisk/DockerProjects/Mysql && chmod -R 755 /datadisk/DockerProjects/Mysql && cd /datadisk/DockerProjects/Mysql
>
>         ```
>     2.  创建容器
>         ```bash
>         docker run -itd --restart=always --name Mysql  -p 3306:3306 -v $PWD/mysqld/:/var/run/mysqld/ -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=6d74a206 -d mysql
>
>         ```
>     3.  进入容器
>         ```bash
>         docker exec -it Mysql /bin/bash 
>         ```
>         -   mysql -u root -p
>             1.  ALTER USER 'root'@'localhost' IDENTIFIED BY '6d74a206' PASSWORD EXPIRE NEVER;
>             2.  ALTER USER 'root'@'%' IDENTIFIED WITH mysql\_native\_password BY '6d74a206';
>             3.  flush privileges;

> 4\. [Redis](https://www.cnblogs.com/superfeeling/p/16864606.html "Redis") &#x20;
>
> -   详细操作
>     -   创建标准配置文件并上传到项目根目录  (**redis.conf**) 里面也需要配置密码
>         ```bash
>         # bind 192.168.1.100 10.0.0.1
>         # bind 127.0.0.1 ::1
>         # bind 127.0.0.1
>
>         protected-mode no
>
>         port 6379
>
>         tcp-backlog 511
>
>         requirepass 6d74a206
>
>         timeout 0
>
>         tcp-keepalive 300
>
>         daemonize no
>
>         supervised no
>
>         pidfile /var/run/redis_6379.pid
>
>         loglevel notice
>
>         logfile ""
>
>         databases 30
>
>         always-show-logo yes
>
>         save 900 1
>         save 300 10
>         save 60 10000
>
>         stop-writes-on-bgsave-error yes
>
>         rdbcompression yes
>
>         rdbchecksum yes
>
>         dbfilename dump.rdb
>
>         dir ./
>
>         replica-serve-stale-data yes
>
>         replica-read-only yes
>
>         repl-diskless-sync no
>
>         repl-disable-tcp-nodelay no
>
>         replica-priority 100
>
>         lazyfree-lazy-eviction no
>         lazyfree-lazy-expire no
>         lazyfree-lazy-server-del no
>         replica-lazy-flush no
>
>         appendonly yes
>
>         appendfilename "appendonly.aof"
>
>         no-appendfsync-on-rewrite no
>
>         auto-aof-rewrite-percentage 100
>         auto-aof-rewrite-min-size 64mb
>
>         aof-load-truncated yes
>
>         aof-use-rdb-preamble yes
>
>         lua-time-limit 5000
>
>         slowlog-max-len 128
>
>         notify-keyspace-events ""
>
>         hash-max-ziplist-entries 512
>         hash-max-ziplist-value 64
>
>         list-max-ziplist-size -2
>
>         list-compress-depth 0
>
>         set-max-intset-entries 512
>
>         zset-max-ziplist-entries 128
>         zset-max-ziplist-value 64
>
>         hll-sparse-max-bytes 3000
>
>         stream-node-max-bytes 4096
>         stream-node-max-entries 100
>
>         activerehashing yes
>
>         hz 10
>
>         dynamic-hz yes
>
>         aof-rewrite-incremental-fsync yes
>
>         rdb-save-incremental-fsync yes
>         ```
>     1.  创建文件夹
>         ```bash
>         mkdir -p /datadisk/DockerProjects/Redis && chmod -R 755 /datadisk/DockerProjects/Redis && cd /datadisk/DockerProjects/Redis
>
>         ```
>     2.  创建容器
>         ```bash
>         docker run --restart=always --log-opt max-size=100m --log-opt max-file=2 -p 6379:6379 --name Redis -v $PWD/redis.conf:/etc/redis/redis.conf -v $PWD/data:/data -d redis redis-server /etc/redis/redis.conf --appendonly yes  --requirepass 6d74a206
>
>         ```
>     3.  进入容器
>         ```bash
>         docker exec -it Redis /bin/bash 
>         ```
>     -   测试
>         1.  通过docker ps指令查看启动状态
>             ```bash
>             docker ps -a |grep myredis 
>             ```
>         2.  查看容器运行日志  -- 30分钟内的
>             ```bash
>             docker logs --since 30m Redis
>             ```
>         3.  容器内部连接进行测试
>             ```bash
>             docker exec -it Redis redis-cli
>             ```
>         4.  验证密码
>             ```bash
>             auth 密码
>             ```
>         5.  查看当前redis有没有设置密码
>             ```bash
>             config get < timeout-字段 >
>             ```

> 5\. Nginx Proxy Manager. (前提：不能安装nginx)
>
> -   详细操作
>     ```bash
>     mkdir -p /datadisk/DockerProjects/NginxProxyManager && chmod -R 755  /datadisk/DockerProjects/NginxProxyManager && cd  /datadisk/DockerProjects/NginxProxyManager
>     ```
>     ```bash
>     vim docker-compose.yml
>     ```
>     ```bash
>     version: "3"
>     services:
>       app:
>         image: 'jc21/nginx-proxy-manager:latest'
>         restart: unless-stopped
>         hostname: NginxProxyManager
>         container_name: NginxProxyManager
>         ports:
>           # These ports are in format <host-port>:<container-port>
>           - '80:80' # Public HTTP Port
>           - '443:443' # Public HTTPS Port
>           - '81:81' # Admin Web Port
>           # Add any other Stream port you want to expose
>           # - '21:21' # FTP
>         environment:
>           DB_MYSQL_HOST: "db"
>           DB_MYSQL_PORT: 3306
>           DB_MYSQL_USER: "npm"
>           DB_MYSQL_PASSWORD: "npm"
>           DB_MYSQL_NAME: "npm"
>           # Uncomment this if IPv6 is not enabled on your host
>           # DISABLE_IPV6: 'true'
>         volumes:
>           - ./data:/data
>           - ./letsencrypt:/etc/letsencrypt
>         depends_on:
>           - db
>
>       db:
>         image: 'jc21/mariadb-aria:latest'
>         restart: unless-stopped
>         hostname: Nginx-Mariadb
>         container_name: Nginx-Mariadb
>         environment:
>           MYSQL_ROOT_PASSWORD: 'npm'
>           MYSQL_DATABASE: 'npm'
>           MYSQL_USER: 'npm'
>           MYSQL_PASSWORD: 'npm'
>         volumes:
>           - ./data/mysql:/var/lib/mysql
>
>     ```
>     ```bash
>     docker-compose up -d
>     ```
>     ```bash
>     http://[2603:c022:8004:7900:3c0a:3efc:233:6e8a]:81/login
>
>     admin@example.com
>     changeme
>
>
>     SoloAsural@163.com
>     94591026LoVe 登录
>     ```

> 5\. 自搭建 ChatGPT
>
> -   详细操作
>     1.  创建目录
>         ```bash
>         mkdir -p /datadisk/WebSites/ChatGPT/ && chmod -R 755 /datadisk/WebSites/ChatGPT/ && cd /datadisk/WebSites/ChatGPT/
>         ```
>     2.  创建脚本
>         ```bash
>         vim docker-compose.yml
>         ```
>         ```bash
>         version: '3'
>
>         services:
>           app:
>             image: chenzhaoyu94/chatgpt-web:main
>             restart: unless-stopped
>             hostname: ChatGPT
>             container_name: ChatGPT
>             ports:
>               - 3002:3002
>             environment:
>               OPENAI_API_KEY: [api]
>         ```
>     3.  启动docker
>         ```bash
>         docker-compose up -d
>         ```
>     4.  配置域名
>         ```bash
>         service nginx stop
>
>         mkdir -p /etc/nginx/cert/chat.soloasural.eu.org && chmod -R 755 /etc/nginx/cert/chat.soloasural.eu.org
>         ~/.acme.sh/acme.sh --register-account -m SoloAsural@gmail.com
>
>         ~/.acme.sh/acme.sh --issue -d chat.soloasural.eu.org --standalone
>         ~/.acme.sh/acme.sh --installcert -d chat.soloasural.eu.org --key-file /etc/nginx/cert/chat.soloasural.eu.org/key.pem --fullchain-file /etc/nginx/cert/chat.soloasural.eu.org/cert.pem
>         ```
>     5.  nginx反代
>         ```bash
>         vim /etc/nginx/nginxConFiles/chat.soloasural.eu.org.conf
>         ```
>         ```bash
>         server {
>             listen 80;
>             server_name chat.soloasural.eu.org;
>             return 301 https://$host$request_uri;
>         }
>
>         server {
>             listen 443 ssl http2;
>             
>             server_name chat.soloasural.eu.org;
>             
>             ssl_certificate /etc/nginx/cert/chat.soloasural.eu.org/cert.pem;
>             ssl_certificate_key /etc/nginx/cert/chat.soloasural.eu.org/key.pem;
>             location / {
>                 proxy_pass http://127.0.0.1:3002;
>                 proxy_set_header Host $host;
>                 proxy_set_header X-Real-IP $remote_addr;
>                 proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
>             }
>         }
>         ```

> 6\. [10分钟搭建一个轻量、快速、美观的个人导航页面——Flare](https://blog.laoda.de/archives/docker-compose-install-flare "10分钟搭建一个轻量、快速、美观的个人导航页面——Flare")  ([GitHub](https://github.com/soulteary/docker-flare "GitHub"))
>
> -   详细操作
>     1.  创建文件
>         ```bash
>         mkdir -p /datadisk/DockerProjects/Flare && chmod -R 755  /datadisk/DockerProjects/Flare && cd  /datadisk/DockerProjects/Flare
>         ```
>     2.  创建脚本
>         ```bash
>         vim docker-compose.yml
>         ```
>     3.  编写文件
>         ```bash
>         version: '3.6'
>
>         services:
>           flare:
>             image: soulteary/flare
>             restart: always
>             hostname: Flare
>             container_name: Flare
>             # 默认无需添加任何参数，如有特殊需求
>             # 可阅读文档 https://github.com/soulteary/docker-flare/blob/main/docs/advanced-startup.md
>             command: flare
>             # 启用账号登陆模式
>             command: flare --nologin=0
>             environment:
>               # 如需开启用户登陆模式，需要先设置 `nologin` 启动参数为 `0`
>               # 如开启 `nologin`，未设置 FLARE_USER，则默认用户为 `flare`
>               - FLARE_USER=SoloAsural
>               # 指定你自己的账号密码，如未设置 `FLARE_USER`，则会默认生成密码并展示在应用启动日志中
>               - FLARE_PASS=94591026LoVe
>               # 是否开启“使用向导”，访问 `/guide`
>               - FLARE_GUIDE=1
>             ports:
>               - 3020:5005
>             volumes:
>               - ./app:/app
>         ```
>     4.  启动docker
>         ```bash
>         docker-compose up -d
>         ```
>     5.  配置域名
>         ```bash
>         service nginx stop
>
>         mkdir -p /etc/nginx/cert/tag.soloasural.eu.org && chmod -R 755 /etc/nginx/cert/tag.soloasural.eu.org
>         ~/.acme.sh/acme.sh --register-account -m SoloAsural@gmail.com
>
>         ~/.acme.sh/acme.sh --issue -d tag.soloasural.eu.org --standalone
>         ~/.acme.sh/acme.sh --installcert -d tag.soloasural.eu.org --key-file /etc/nginx/cert/tag.soloasural.eu.org/key.pem --fullchain-file /etc/nginx/cert/tag.soloasural.eu.org/cert.pem
>         ```
>     6.  nginx反代
>         ```bash
>         vim /etc/nginx/nginxConFiles/tag.soloasural.eu.org.conf
>         ```
>         ```bash
>         server {
>             listen 80;
>             server_name tag.soloasural.eu.org;
>             return 301 https://$host$request_uri;
>         }
>
>         server {
>             listen 443 ssl http2;
>             
>             server_name tag.soloasural.eu.org;
>             
>             ssl_certificate /etc/nginx/cert/tag.soloasural.eu.org/cert.pem;
>             ssl_certificate_key /etc/nginx/cert/tag.soloasural.eu.org/key.pem;
>             location / {
>                 proxy_pass http://127.0.0.1:3020;
>                 proxy_set_header Host $host;
>                 proxy_set_header X-Real-IP $remote_addr;
>                 proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
>             }
>         }
>         ```
>     7.  更新Flare
>         ```bash
>         cd /datadisk/DockerProjects/Flare
>
>         docker-compose down 
>
>         # 万事先备份，以防万一
>         cp -r /datadisk/DockerProjects/Flare /datadisk/DockerProjects/Flare.archive  
>
>         docker-compose pull
>
>         # 请不要使用 docker-compose stop 来停止容器，因为这么做需要额外的时间等待容器停止；docker-compose up -d 直接升级容器时会自动停止并立刻重建新的容器，完全没有必要浪费那些时间。
>         docker-compose up -d    
>
>         # prune 命令用来删除不再使用的 docker 对象。删除所有未被 tag 标记和未被容器使用的镜像
>         docker image prune  
>
>         ```

> 7\. Freenom域名自动续期
>
> -   详细操作
>     1.  创建目录
>         ```bash
>         mkdir /datadisk/DockerProjects/FreenomAutomatic/ && chmod -R 755 /datadisk/DockerProjects/FreenomAutomatic/ && cd /datadisk/DockerProjects/FreenomAutomatic/
>         ```
>     2.  部署域名续期脚本
>         ```bash
>         docker run -d --name FreenomAutomatic --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs luolongfei/freenom
>         ```
>     3.  ~~添加域名nameserver (这里不使用)~~
>         ```bash
>         RYLEIGH.NS.CLOUDFLARE.COM
>         SERGI.NS.CLOUDFLARE.COM
>         ```
>     4.  配置分解【参考】
>         -   分解详情
>             1.  Freenom 账户 / 密码 → [官网](https://my.freenom.com/clientarea.php?action=domains "官网")
>                 ```bash
>                 ######################  账户配置 Account config  #########################
>                 # Freenom 账户 Freenom Account
>                 FREENOM_USERNAME='boudagrigrz@gmail.com'
>
>                 # Freenom 密码 Freenom password
>                 FREENOM_PASSWORD='n3u9_tH3j@SU8Vr'
>
>                 # 【可选】 Freenom 代理 [Optional] Freenom proxy e.g. http://127.0.0.1:1081 or socks5://127.0.0.1:1080
>                 FREENOM_PROXY=''
>                 ######################  end 账户配置  #########################
>                 ```
>             2.  通知邮件配置 Email config
>                 ```bash
>                 ######################  通知邮件配置 Email config  #########################
>                 # 机器人邮箱账户 Email of robot
>                 MAIL_USERNAME='iAsural@163.com'
>
>                 # 机器人邮箱密码（Gmail填密码，QQ邮箱或163邮箱填授权码） Password of the robot email
>                 MAIL_PASSWORD='VIFNWKBJGEOOQYYH'
>
>                 # 用于接收通知的邮箱 Email address used to receive notifications
>                 TO='iAsural@163.com'
>
>                 # 是否启用邮件推送功能 1：启用 0：不启用 Whether to enable email push features 1: enabled 0: not enabled
>                 MAIL_ENABLE=1
>
>                 # 【可选】 SMTP 服务器 [Optional] SMTP server e.g. smtp.gmail.com
>                 MAIL_HOST='smtp.163.com'
>
>                 # 【可选】 SMTP 端口号，一般是 587 或者 465 [Optional] SMTP port number, usually 587 or 465
>                 MAIL_PORT='25'
>
>                 # 【可选】 邮件加密方式，一般是 tls 或者 ssl 或者 starttls [Optional] Mail encryption method, usually tls or ssl or starttls
>                 MAIL_ENCRYPTION='tls'
>
>                 # end 自定义邮箱配置 end of custom email config
>                 ######################  end 通知邮件配置  #########################
>                 ```
>             3.  Telegram bot 发送通知消息
>                 ```bash
>                 ######################  Telegram bot  #########################
>                 # 通过 Telegram bot 发送通知消息 Send messages via Telegram bot
>
>                 # 你的 chat_id，通过发送“/start”给 @userinfobot 可以获取自己的 id Your chat_id, you can get your own id by sending "/start" to @userinfobot
>                 TELEGRAM_CHAT_ID='6093257014'
>
>                 # 你的 Telegram bot 的 token Token for your Telegram bot
>                 TELEGRAM_BOT_TOKEN='5765903614:AAEaE-22rryCe5by2PKT1ts3u6KxfMahUgE'
>
>                 # 【可选】 自建 Telegram 反向代理地址，不明白则请忽略此配置项，保持默认即可 [Optional] Please do not modify this item
>                 # 参考：https://web.archive.org/web/20220221035315/https://hostloc.com/thread-805441-1-1.html
>                 # 只要是一个合法的网址即可，程式会自动提取网址的主机部分。例如 https://xxx.xx.workers.dev/ or xxx.xx.xx
>                 CUSTOM_TELEGRAM_HOST='api.telegram.org'
>
>                 # 是否启用 Telegram Bot 功能 1：启用 0：不启用 Whether to enable Telegram Bot features 1: enabled 0: not enabled
>                 TELEGRAM_BOT_ENABLE=1
>                 ######################  end Telegram bot  #########################
>                 ```
>             4.  企业微信
>                 ```bash
>                 ######################  企业微信  #########################
>                 # 企业 ID Corporate ID
>                 WECHAT_CORP_ID='ww6cb30c14c584c0de'
>
>                 # 应用的凭证密钥 Credential keys for enterprise WeChat applications
>                 WECHAT_CORP_SECRET='DleWVHZ_bg4YoqpSORSu8WlbaHnIgNAPwY8nXbCjGkg'
>
>                 # 应用 ID
>                 WECHAT_AGENT_ID='1000002'
>
>                 # 是否启用企业微信送信功能 1：启用 0：不启用 Whether to enable the enterprise WeChat message push function 1: Enable 0: Do not enable
>                 WECHAT_ENABLE=1
>                 ######################  end 企业微信  #########################
>                 ```
>     5.  完整配置
>         ```bash
>         vim .env
>         ```
>         ```bash
>         #####################################################################
>         # 注意事项
>         #
>         # - 环境变量的格式为“键=值”，顶格写，注意等号两边不能有空格，值可以用单引号或者双引号引起来，不引也行（下面的特殊情况必须引起来）
>         # - 因为环境变量中“#”代表注释，若密码中存在“#”字符的，一定要使用单引号将整个密码引起来，否则解析会在“#”字符前截止，如果密码中存在单双引号的，
>         #    需要在单双引号前加“\”转义
>         # - 配置多账户不可省略单引号，且多个账户和密码的格式必须是“<账户1>@<密码1>|<账户2>@<密码2>|<账户3>@<密码3>”，不要有空格，就算有程序也会给你干掉
>         #    e.g. MULTIPLE_ACCOUNTS='<账户1>@<密码1>|<账户2>@<密码2>|<账户3>@<密码3>'
>         #    注意不要省略“<>”符号，否则无法正确匹配
>         # - 若你只有单个账户，只配置 FREENOM_USERNAME 和FREENOM_PASSWORD 就够了
>         # - 单账户和多账户的配置会被合并在一起读取并去重
>         #####################################################################
>
>         # .env 文件版本
>         ENV_FILE_VERSION='v2.4'
>
>         ######################  账户配置 Account config  #########################
>         # Freenom 账户 Freenom Account
>         FREENOM_USERNAME='boudagrigrz@gmail.com'
>
>         # Freenom 密码 Freenom password
>         FREENOM_PASSWORD='n3u9_tH3j@SU8Vr'
>
>         ######################  end 账户配置  #########################
>
>         ######################  通知邮件配置 Email config  #########################
>         # 机器人邮箱账户 Email of robot
>         MAIL_USERNAME='iAsural@163.com'
>
>         # 机器人邮箱密码（Gmail填密码，QQ邮箱或163邮箱填授权码） Password of the robot email
>         MAIL_PASSWORD='VIFNWKBJGEOOQYYH'
>
>         # 用于接收通知的邮箱 Email address used to receive notifications
>         TO='iAsural@163.com'
>
>         # 是否启用邮件推送功能 1：启用 0：不启用 Whether to enable email push features 1: enabled 0: not enabled
>         MAIL_ENABLE=1
>
>         # 【可选】 SMTP 服务器 [Optional] SMTP server e.g. smtp.gmail.com
>         MAIL_HOST='smtp.163.com'
>
>         # 【可选】 SMTP 端口号，一般是 587 或者 465 [Optional] SMTP port number, usually 587 or 465
>         MAIL_PORT='25'
>
>         # 【可选】 邮件加密方式，一般是 tls 或者 ssl 或者 starttls [Optional] Mail encryption method, usually tls or ssl or starttls
>         MAIL_ENCRYPTION='tls'
>         ######################  end 通知邮件配置  #########################
>
>         ######################  Telegram bot  #########################
>         # 通过 Telegram bot 发送通知消息 Send messages via Telegram bot
>
>         # 你的 chat_id，通过发送“/start”给 @userinfobot 可以获取自己的 id Your chat_id, you can get your own id by sending "/start" to @userinfobot
>         TELEGRAM_CHAT_ID='6093257014'
>
>         # 你的 Telegram bot 的 token Token for your Telegram bot
>         TELEGRAM_BOT_TOKEN='5765903614:AAEaE-22rryCe5by2PKT1ts3u6KxfMahUgE'
>
>         # 【可选】 自建 Telegram 反向代理地址，不明白则请忽略此配置项，保持默认即可 [Optional] Please do not modify this item
>         # 参考：https://web.archive.org/web/20220221035315/https://hostloc.com/thread-805441-1-1.html
>         # 只要是一个合法的网址即可，程式会自动提取网址的主机部分。例如 https://xxx.xx.workers.dev/ or xxx.xx.xx
>         CUSTOM_TELEGRAM_HOST='api.telegram.org'
>
>         # 是否启用 Telegram Bot 功能 1：启用 0：不启用 Whether to enable Telegram Bot features 1: enabled 0: not enabled
>         TELEGRAM_BOT_ENABLE=1
>         ######################  end Telegram bot  #########################
>
>         ######################  企业微信  #########################
>         # 企业 ID Corporate ID
>         WECHAT_CORP_ID='ww6cb30c14c584c0de'
>
>         # 应用的凭证密钥 Credential keys for enterprise WeChat applications
>         WECHAT_CORP_SECRET='DleWVHZ_bg4YoqpSORSu8WlbaHnIgNAPwY8nXbCjGkg'
>
>         # 应用 ID
>         WECHAT_AGENT_ID='1000002'
>
>         # 是否启用企业微信送信功能 1：启用 0：不启用 Whether to enable the enterprise WeChat message push function 1: Enable 0: Do not enable
>         WECHAT_ENABLE=1
>         ######################  end 企业微信  #########################
>
>         # 通知频率 0：仅当有续期操作的时候 1：每次执行 Notification frequency 0: Only when there is a renewal operation 1: Each execution
>         NOTICE_FREQ=1
>
>         # 是否验证服务器证书 1：验证 0：不验证 Whether to verify the server certificate 1: verify 0: no verification
>         VERIFY_SSL=0
>
>         # 是否开启 Debug 模式 1：开启 0：关闭 Whether to turn on Debug mode 1: On 0: Off
>         DEBUG=0
>
>         # 检测是否有新版本可用，发现新版本时推送消息通知 1：开启 0：关闭 Automatically detects if a new version is available and pushes a message notification when a new version is found 1: On 0: Off
>         NEW_VERSION_DETECTION=1
>
>         # 应用语言配置 Application language configuration, the supported values are zh or en, zh means Chinese, en means English
>         LANGUAGE=zh
>
>         # 送信时是否显示服务器信息 1：显示 0：不显示 Whether to display server information when sending messages 1: Display 0: Do not display
>         SHOW_SERVER_INFO=1
>
>         ```
>     6.  重启容器执行
>         ```bash
>         docker restart FreenomAutomatic
>         ```
>     7.  部署域名续期脚本
>         ```bash
>         docker logs FreenomAutomatic
>         ```
