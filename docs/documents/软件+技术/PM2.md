# PM2

05/2 20:11 - 安装nodejs  【[https://nodejs.org/zh-cn/download/](https://nodejs.org/zh-cn/download/ "https://nodejs.org/zh-cn/download/") 查看最新版本号】

curl -sL [https://deb.nodesource.com/setup\_16.x](https://deb.nodesource.com/setup_8.x "https://deb.nodesource.com/setup_16.x") | sudo -E bash -&#x20;

sudo apt-get install -y nodejs

node -v

npm -v

05/2 20:18 - 安装NginxConfig

-   05/02 22:26 - 安装pm2  【[PM2入坑详解](https://www.jianshu.com/p/1778deeb428e "PM2入坑详解")】
    1.  全局安装
        1.  npm install pm2 -g
    -   常用命令
        1.  启动一个node程序
            1.  pm2 start start.js
                ![](https://img.php.cn/upload/image/150/878/692/1640776213179644.png)
        2.  启动进程并指定应用的程序名
            1.  pm2 start app.js --name application1
        3.  集群模式启动
            ```powershell
            // -i 表示 number-instances 实例数量
            // max 表示 PM2将自动检测可用CPU的数量 可以自己指定数量

            pm2 start start.js -i max
            ```
            ![](https://img.php.cn/upload/image/132/650/889/1640776217710484.png)
        4.  添加进程监视
            ```powershell
            // 在文件改变的时候会重新启动程序

            pm2 start app.js --name start --watch
            ```
        5.  列出所有进程
            ```powershell
            pm2 list

            pm2 ls // 简写
            ```
        6.  从进程列表中删除进程
            ```powershell
            // pm2 delete [appname] | id

            pm2 delete app  // 指定进程名删除

            pm2 delete 0    // 指定进程id删除
            ```
        7.  删除进程列表中所有进程
            ```powershell
            pm2 delete all
            ```
        8.  查看某个进程具体情况
            ```bash
            pm2 describe app

            👇推荐方法
            pm2 show app_name|app_id

            ```
        9.  查看进程的资源消耗情况
            ```bash
            pm2 monit
            ```
        10. 重启进程
            ```bash
            pm2 restart app // 重启指定名称的进程

            pm2 restart all // 重启所有进程
            ```
        11. 查看进程日志
            ```bash
            pm2 logs app    // 查看该名称进程的日志

            pm2 logs all    // 查看所有进程的日志
            ```
        12. 设置pm2开机自启
            ```bash
            1. 开启启动设置，此处是CentOS系统，其他系统替换最后一个选项（可选项：ubuntu, centos, redhat, gentoo, systemd, darwin, amazon）
            pm2 startup ubuntu

            2. 开机启动
            systemctl enable pm2-root

            3. 保存
            pm2 save

            ```
