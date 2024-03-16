#!/usr/bin/env bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

echo -e "${RED}请输入git commit内容！${RESET}"

default_commit="Github Action 自动部署. $(date +"%Y-%m-%d %H:%M:%S")"

read -p "(回车使用默认提交信息：$default_commit): " msg

msg="${msg:-$default_commit}"

if [ !-d .git ]; then
  git init
else
  echo "本地已经执行过git init，不再执行。"
fi

git add -A

git commit -m "$msg"

# git push -v -f git@github.com:GitHubAsural/VitePressSite.git

rm -rf docs/.vitepress/dist docs/.vitepress/cache
