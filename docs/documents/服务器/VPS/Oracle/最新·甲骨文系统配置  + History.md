# 最新·甲骨文系统配置  + History

脚本参考:

1.  [https://blog.laoda.de/archives/useful-script#bbr](https://blog.laoda.de/archives/useful-script#bbr "https://blog.laoda.de/archives/useful-script#bbr")
2.  [R-Bot⭐](https://github.com/semicons/java_oci_manage "R-Bot⭐")

04/17 22:59 - 申请服务器（最好选Arm，配置高）

-   04/17 23:01 通过FinalShell配置服务器
    1.  FinalShell登录
    2.  修改主机名称
        ```bash
        hostnamectl

        vim /etc/hostname

        VPS-Ubuntu-20-04-Seoul-Amds-02

        vim /etc/hosts

        127.0.0.1 VPS-Ubuntu-20-04-Seoul-Amds-02  VPS-Ubuntu-20-04-Seoul-Amds-02
        ```
    3.  切换root账户
        1.  sudo -i
        2.  passwd  root
        -   下载系统配置脚本 (选二)
            1.  一
                1.  mkdir /a-shell && chmod -R 755 /a-shell && cd /a-shell
                2.  wget --no-check-certificate [https://raw.githubusercontent.com/jinwyp/one\_click\_script/master/trojan\_v2ray\_install.sh](https://raw.githubusercontent.com/jinwyp/one_click_script/master/trojan_v2ray_install.sh "https://raw.githubusercontent.com/jinwyp/one_click_script/master/trojan_v2ray_install.sh") && chmod +x ./trojan\_v2ray\_install.sh && ./trojan\_v2ray\_install.sh
                    ```bash
                    42    开启root用户SSH登陆, 如谷歌云默认关闭root登录,可以通过此项开启

                    ```
            2.  二
                ```bash
                sudo -i
                ```
                ```bash
                echo root:6d74a206 |sudo chpasswd root
                ```
                ```bash
                sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
                ```
                ```bash
                sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
                ```
                ```bash
                sudo service sshd restart
                ```
            3.  reboot
            4.  先使用“FlashFXP”连接一下，如果能连接成功则“SSH”登录没问题
        1.  使用cmder登录（可以 ssh + root登录了）
        2.  ~~修改源 <⚠️\~\~\~\~注意：ARM-Ubuntu20.4版本不能还源· 可跳过这步\~\~\~\~>~~
            -   ~~编辑源~~[~~（ubuntu20.04 更换国内163源、阿里源、清华源、中科大源）~~](https://www.jianshu.com/p/5a3caeca8c28 "（ubuntu20.04 更换国内163源、阿里源、清华源、中科大源）")
                1.  备份旧的源
                    ```bash
                    sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup 
                    ```
                2.  编辑源
                    ```bash
                    vim /etc/apt/sources.list
                     
                    ```
                3.  &#x20;添加  > 中科大源【推荐】
                    ```bash
                    deb https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse

                    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse

                    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse

                    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse

                    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse

                    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse

                    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse

                    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse

                    deb https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse

                    deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse 
                    ```
                4.  [Ubuntu20.04 arm 更换清华源](https://www.cnblogs.com/mirage-mc/p/16437505.html "Ubuntu20.04 arm 更换清华源")
                    ```bash
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal universe
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates universe
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal multiverse
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates multiverse
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security universe
                    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security multiverse
                    ```
            更新

            `apt update && apt upgrade`
            -   Tmpmail 临时邮箱【需要环境上面👆提前安装：`apt-get  install jq w3c xclip`】
                ```bash
                curl -L 'https://raw.githubusercontent.com/sdushantha/tmpmail/master/tmpmail' > tmpmail && chmod +x tmpmail
                mv tmpmail /usr/local/bin/
                ```
                > 追更：mac上先安装环境  `brew install jq w3c xclip`
                -   邮箱使用
                    ```go
                    # 创建新邮箱
                     tmpmail  --generate

                    # 查看邮件列表
                     tmpmail 

                    # 查看最新邮件
                     tmpmail   -r

                    # 打开邮件
                     tmpmail 84248310 

                    # 查看纯文本
                     tmpmail  -t  84248310 

                    # 帮助
                     tmpmail  -h 
                    ```

[SSH远程访问及控制——远程登录服务器并传输数据](https://www.cnblogs.com/weq0805/p/14960255.html "SSH远程访问及控制——远程登录服务器并传输数据")[(参考链接)](https://www.cnblogs.com/yjmyzz/p/4019783.html "(参考链接)")

[Ubuntu20.04配置OH-MY-ZSH](https://www.wolai.com/hgBFsPRFCfNngBYNJKMUbr "Ubuntu20.04配置OH-MY-ZSH")

-   04/17 21:22 - vim设置行号 更多参数设置[(参考链接)](https://www.cnblogs.com/yjmyzz/p/4019783.html "(参考链接)")
    ```bash
    cat <<EOF |sudo tee -a /etc/vim/vimrc
    syntax on
    set number
    set autoindent
    EOF

    ```
-   04/17 23:15 - 修改ssh在线时间
    1.  [**解决Ubuntu的SSH自动断线问题**](https://blog.nowcoder.net/n/e7223c8035534a24b5d764556ed023e1 "解决Ubuntu的SSH自动断线问题") （参考）
    2.  追加处理·自动断线
        ```bash
        cat <<EOF |sudo tee -a /etc/ssh/ssh_config


            IPQoS=throughput
            # 断开时重试连接的次数
            ServerAliveCountMax 999
            # 每隔5秒自动发送一个空的请求以保持连接
            ServerAliveInterval 20
        EOF

        ```
        ```bash
        cat <<EOF |sudo tee -a /etc/ssh/sshd_config

        ClientAliveInterval 200
        ClientAliveCountMax 60
        EOF

        ```
    3.  重启服务
        ```bash
        service sshd restart
        ```
-   04/17 23:16 - 修改Ubuntu系统的用户名和主机名 【zsh已安装前提下】（跳过）
    ```bash
    hostnamectl set-hostname "VPS.Ubuntu.20.04.Seoul.Intel.01"
    hostnamectl set-hostname "VPS.Ubuntu.20.04.Seoul.Intel.01" --pretty
    hostnamectl set-hostname "VPS.Ubuntu.20.04.Seoul.Intel.01" --static
    hostnamectl set-hostname "VPS.Ubuntu.20.04.Seoul.Intel.01" --transient
    reboot

    ```
-   04/18 15:56 - 域名常用网站
    1.  [freenom【免费域名申请】](https://my.freenom.com/clientarea.php?action=domains "freenom【免费域名申请】")
    2.  [https://dash.cloudflare.com 【解析网站】](https://dash.cloudflare.com/b7dd295b5579013c1fe4d7ad3ff561f8/orbi.ml/dns "https://dash.cloudflare.com 【解析网站】")
    3.  [Eu.org ](https://nic.eu.org/arf/en/ "Eu.org ")  + [TopDN.net](https://topdn.net/ "TopDN.net")    （参考：[eu.org 永久免费域名注册](https://www.youtube.com/watch?v=In3UZAYiP2c "eu.org 永久免费域名注册")  [文字版](https://kejilion.blogspot.com/2022/06/euorg.html "文字版")）
        <https://www.youtube.com/watch?v=qkTfdptBivs>
-   04/18 15:57 - 申请ACME / SSL证书
    1.  安装x-ui  [( 选2可配置TG 推荐👍)](https://gitlab.com/rwkgyg "( 选2可配置TG 推荐👍)")
        1.  bash <(curl -Ls <https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh>)
        2.  `wget -N https://gitlab.com/rwkgyg/x-ui-yg/raw/main/install.sh && bash install.sh`
        3.  用户名：SoloAsural  密码：94591026LoVe  端口号：9459
    2.  通过80端口申请，必须先安装nginx，但是需要停用nginx的服务
        1.  service nginx stop
    3.  \~\~下载ACME脚本   \~\~[~~申请ACME / SSL证书(参考链接)~~](https://www.v2rayssr.com/ssl.html "申请ACME / SSL证书(参考链接)")

        以下可通过 一 号机的“[Nginx Proxy Manager](https://nginx.soloasural.ml/ "Nginx Proxy Manager")”获取
        ```bash
        curl https://get.acme.sh | sh

        ```
        ```bash
        wget -N https://gitlab.com/rwkgyg/acme-script/raw/main/acme.sh && bash acme.sh
         续签
        ```
    4.  开启防火墙 （不可跳过）
        ```bash
        iptables -P INPUT ACCEPT
        iptables -P FORWARD ACCEPT
        iptables -P OUTPUT ACCEPT
        iptables -F
        apt-get purge netfilter-persistent
        sudo apt-get install iptables-persistent -y

        ```
    5.  放行端口
        ```bash
        【 可以不执行，到这步已开启了 】
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 8443 -j ACCEPT
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 8888 -j ACCEPT
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 443 -j ACCEPT
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 22 -j ACCEPT
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 3306 -j ACCEPT

        sudo iptables-save
        sudo netfilter-persistent save
        sudo netfilter-persistent reload
        apt update && apt dist-upgrade -y && apt autoremove -y
        reboot
        ```
        ```bash
        ++++++++++++++++++++++++++++++  开放端口参考  ++++++++++++++++++++++++++++++++++++++++++++++
        sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 3306 -j ACCEPT
        sudo iptables-save
        sudo netfilter-persistent save
        sudo netfilter-persistent reload
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        --------------------------------  排查问题    ----------------------------------------------

        iptables -h
        iptables --list
        iptables --list-rules
        -------------------------------------------------------------------------------------------
         以上作为参考
        ```
    6.  ACME注册
        ```bash
        curl https://get.acme.sh | sh
        ```
        ```bash
        cat <<EOF |sudo tee -a /etc/profile
        alias acme.sh=~/.acme.sh/acme.sh
        export CF_Key="784b1cf3a9c7147be58d3add665eb51a456b6"
        export CF_Email="WZ9459@163.com"
        EOF


        source /etc/profile

        ```
        ```bash
        acme.sh --register-account -m WZ9459@163.com

        acme.sh  --issue -d vps3.soloasural.ml  --standalone

        acme.sh --installcert -d vps3.soloasural.ml --key-file /root/private.key --fullchain-file /root/cert.crt
        ```
-   04/18 16:08 - [设置x-ui面板](https://vps2.soloasural.ml:9459 "设置x-ui面板")
    1.  面板证书公钥文件路径
        1.  /root/ygkkkca/cert.crt
    2.  面板证书密钥文件路径
        1.  /root/ygkkkca/private.key
-   04/18 16:08 - 设置BBR类型
    1.  查看当前系统加速类型
        1.  sysctl net.ipv4.tcp\_congestion\_control
    2.  将当前系统切换成BBR+fq加速
        ```bash
        echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
        echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

        sysctl -p

        sysctl net.ipv4.tcp_available_congestion_control

        lsmod | grep bbr

        ```
-   04/18 16:16 - scp是linux下的远程拷贝
    1.  将本地文件拷贝到远程：scp  文件名 用户名@计算机IP或者计算机名称:远程路径&#x20;
    2.  从远程将文件拷回本地：scp  用户名@计算机IP或者计算机名称:文件名 本地路径
    3.  将本地目录拷贝到远程：scp -r 目录名   用户名@计算机IP或者计算机名称:远程路径
    4.  从远程将目录拷回本地：scp -r   用户名@计算机IP或者计算机名称:目录名 本地路径
    5.  scp -r  TourismTp5  root\@132.226.237.112:/datadisk/WebSites/PHP/
    6.  scp -r /datadisk  [root@193.123.224.79](mailto:root@193.123.224.79 "root@193.123.224.79"):/c/
    7.  scp -r /a-shell  [root@](mailto:root@193.123.224.79 "root@")[vps3.soloasural.eu.org](http://vps3.soloasural.eu.org "vps3.soloasural.eu.org"):/a-shell
    8.  scp -r /root/ \*.txt[root@](mailto:root@193.123.224.79 "root@")[vps3.soloasural.eu.org](http://vps3.soloasural.eu.org "vps3.soloasural.eu.org"):/a-shell

08/26 12:16 - 解决SSH断线无法连接（重置SSH完毕，解决）

```bash
rm /etc/ssh/ssh_host_*


sudo dpkg-reconfigure openssh-server

```

05/15 00:30 - [阿里云盘三月自动签到Python脚本，可本地、青龙、云函数自动执行](https://www.yii666.com/blog/353759.html "阿里云盘三月自动签到Python脚本，可本地、青龙、云函数自动执行")
