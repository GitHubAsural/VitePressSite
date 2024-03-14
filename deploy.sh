#!/usr/bin/env  sh

set -e

# npm run docs:build

# cd docs/.vitepress/dist

# 输出标题
echo "请输入git commit内容！"

# 显示默认提示
default_commit="Github Action 自动部署. "$(date +"%Y-%m-%d %H:%M:%S")

# 读取用户输入
read -p "（回车使用默认提交信息：$default_commit）:" msg

# 如果用户输入为空，则使用默认提交信息
if [[ -z "$msg" ]]; then
  msg=$default_commit
fi

# 判断是否已经执行过git init
if [[ -d .git ]]; then
  echo "本地已经执行过git init，不再执行。"
else
  # 执行git init
  git init
fi

git add -A

git commit -m "${msg}"

git push -v -f git@github.com:GitHubAsural/VitePressSite.git

# cd -
# rm -rf docs/.vitepress/dist node_modules docs/.vitepress/cache
rm -rf docs/.vitepress/dist docs/.vitepress/cache