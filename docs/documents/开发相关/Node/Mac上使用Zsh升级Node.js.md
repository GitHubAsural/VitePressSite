# 要在Mac上使用Zsh升级Node.js，可以按照以下步骤进行操作：

>>> 打开终端应用程序。

### 使用Homebrew（包管理器）安装Node Version Manager（NVM）。输入以下命令并按Enter键执行：
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
```
### 安装完成后，打开终端的配置文件，例如.zshrc，输入以下命令并保存退出：
```sh
nano ~/.zshrc
```
在配置文件中添加以下行来配置NVM：
```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
```
重新加载配置文件，使NVM配置生效。输入以下命令并按Enter键执行：
```sh
source ~/.zshrc
```
检查NVM是否安装成功，输入以下命令：
```sh
nvm --version
```
使用NVM安装最新版本的Node.js。输入以下命令并按Enter键执行：
```sh
nvm install node
```
安装完成后，可以使用以下命令验证Node.js的版本：
```sh
node --version
```
### 这样就完成了在Mac上使用Zsh升级Node.js的操作。
