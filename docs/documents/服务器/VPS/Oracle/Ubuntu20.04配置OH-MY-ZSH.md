# Ubuntu20.04配置OH-MY-ZSH

04/27 20:11 - 查看当前SHELL

echo \$SHELL

04/27 20:18 - 安装ZSH

sudo apt-get install zsh -y

卸载：uninstall\_oh\_my\_zsh

08/13 16:47 - 安装Oh-My-Zsh

sh -c "\$(curl -fsSL [https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh](https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh "https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh"))"

08/13 16:49 - 插件

1.  git clone [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions "https://github.com/zsh-users/zsh-autosuggestions") \${ZSH\_CUSTOM:-\~/.oh-my-zsh}/plugins/zsh-autosuggestions
2.  git clone [https://github.com/zsh-users/zsh-syntax-highlighting.git](https://github.com/zsh-users/zsh-syntax-highlighting.git "https://github.com/zsh-users/zsh-syntax-highlighting.git") \${ZSH\_CUSTOM:-\~/.oh-my-zsh}/plugins/zsh-syntax-highlighting
3.  sudo apt-get install autojump

-   08/13 16:49 - 配置

    vim \~/.zshrc

    主题：

    ZSH\_THEME="maran"

    plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

    最后一行加上 （使自动跳转插件生效）

    . /usr/share/autojump/autojump.sh

    使配置生效

    source \~/.zshrc

    reboot

添加新日志
