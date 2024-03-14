# 目前可用脚本
```python
import os
import json
import re

def generate_sidebar(dir_path):
    sidebar_items = []
    for item in os.listdir(dir_path):
        item_path = os.path.join(dir_path, item)
        if os.path.isdir(item_path):
            sub_items = generate_sidebar(item_path)
            if sub_items:
                sidebar_item = {
                    "text": item,
                    "collapsed": True,
                    "items": sub_items
                }
                sidebar_items.append(sidebar_item)
        else:
            file_name, file_extension = os.path.splitext(item)
            if file_extension == ".md":
                link = os.path.join(dir_path, file_name)
                sidebar_item = {
                    "text": file_name,
                    "link": link+".md"
                }
                sidebar_items.append(sidebar_item)
    return sidebar_items

root_dir = "documents"
devPath = ".vitepress/config.mjs"
sidebar = generate_sidebar(root_dir)

# 序列化JSON数据
sidebar_json = json.dumps(sidebar, ensure_ascii=False, indent=2)

# # 使用正则表达式删除sidebar树组 【yes】
# config_content = re.sub(r'sidebar: (\[.*\]),\n', "", config_content, flags=re.DOTALL)

# # 使用正则表达式增加sidebar树组
# config_content = re.sub(r"(socialLinks:\s*\[)", f"sidebar: {sidebar_json},\n  \\1", config_content)

# # 写入修改后的config.mjs文件
with open("data.json", "w", encoding="utf-8") as config_file:
    config_file.write(sidebar_json)
```
# 之前copy版本
```python
import os
import json
import re

def generate_sidebar(dir_path):
    sidebar_items = []
    for item in os.listdir(dir_path):
        item_path = os.path.join(dir_path, item)
        if os.path.isdir(item_path):
            sub_items = generate_sidebar(item_path)
            if sub_items:
                sidebar_item = {
                    "text": item,
                    "collapsed": True,
                    "items": sub_items
                }
                sidebar_items.append(sidebar_item)
        else:
            file_name, file_extension = os.path.splitext(item)
            if file_extension == ".md":
                link = os.path.join(dir_path, file_name)
                sidebar_item = {
                    "text": file_name,
                    "link": link
                }
                sidebar_items.append(sidebar_item)
    return sidebar_items

root_dir = "documents"
sidebar = generate_sidebar(root_dir)

# 读取config.mjs文件
with open("config.mjs", "r", encoding="utf-8") as config_file:
    config_content = config_file.read()

# 使用正则表达式替换sidebar树组
sidebar_json = json.dumps(sidebar, ensure_ascii=False, indent=2)
config_content = re.sub(r"sidebar:\s*\[.*?\]", f"sidebar: {sidebar_json}", config_content, flags=re.DOTALL)
print(sidebar_json)
# 写入修改后的config.mjs文件
# with open("config.mjs", "w", encoding="utf-8") as config_file:
    # config_file.write(config_content)

# print("Sidebar generated and replaced in config.mjs")
```