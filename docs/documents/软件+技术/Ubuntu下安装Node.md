# Ubuntu下安装Node

[ Ubuntu下安装Node - 掘金 1.进入 /usr/local 文件夹并下载 cd /usr/local wgt https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.ta https://juejin.cn/post/7163934082357788679](https://juejin.cn/post/7163934082357788679 " Ubuntu下安装Node - 掘金 1.进入 /usr/local 文件夹并下载 cd /usr/local wgt https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.ta https://juejin.cn/post/7163934082357788679")

安装pnpm

[ Installation | pnpm Using a standalone script https://pnpm.io/installation](https://pnpm.io/installation " Installation | pnpm Using a standalone script https://pnpm.io/installation")

```bash
wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -

source /root/.shrc
```

[ pnpm的安装与使用\_pnpm安装\_itxcr的博客-CSDN博客 pnpm使用官网： https://pnpm.js.org/installation/全局安装npm install pnpm -g设置源//查看源pnpm config get registry //切换淘宝源pnpm config set registry https://registry.npmmirror.com/使用pnpm install 包  // pnpm i 包pnpm add  https://blog.csdn.net/it\_xcr/article/details/114655778](https://blog.csdn.net/it_xcr/article/details/114655778 " pnpm的安装与使用_pnpm安装_itxcr的博客-CSDN博客 pnpm使用官网： https://pnpm.js.org/installation/全局安装npm install pnpm -g设置源//查看源pnpm config get registry //切换淘宝源pnpm config set registry https://registry.npmmirror.com/使用pnpm install 包  // pnpm i 包pnpm add  https://blog.csdn.net/it_xcr/article/details/114655778")
