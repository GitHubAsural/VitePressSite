# Mac 安装软件

> ## 安装Mysql
>
> -   详细操作
>     1.  官网下载软件
>         ```bash
>         https://downloads.mysql.com/archives/community/
>         ```
>     2.  直接安装
>     3.  打开 “MySQL.prefPane”

> ## 安装Redis
>>> [Mac安装 redis(两种方式)](https://www.cnblogs.com/xialigang/p/16248395.html "Mac安装 redis(两种方式)")
>
>
> - 详细操作
>     1.  命令安装
>         ```bash
>         brew install redis
>         ```
>     2.  启动redis
>         ```bash
>         brew services start redis
>         ```
>     3.  连接Redis
>         1.  &#x20;远程服务连接
>             ```bash
>             redis-cli -h IP -p 6379
>
>             ```
>         2.  本机服务连接
>             ```bash
>             redis-cli
>             ```
>         3.  关闭redis服务
>             ```bash
>             redis-cli shutdown
>             ```
