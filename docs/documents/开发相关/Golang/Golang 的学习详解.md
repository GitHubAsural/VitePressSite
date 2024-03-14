# Golang 的学习详解

> `go mod` 是 Go 语言 1.11 版本之后引入的一种依赖管理工具。它可以帮助开发者更方便地管理项目依赖，自动下载和更新依赖项，并且可以支持在不同的版本之间切换。使用 `go mod` 可以让项目的依赖管理更加简单和可靠。

> 下面是常用的 `go mod` 命令和参数：  - 2023·06/20 21:47
>
> -   更多详细的参数和用法可以通过运行 `go help mod` 命令来查看。
>     -   `go mod init`: 初始化一个新的 Go 模块，创建 `go.mod` 文件。
>     -   `go mod tidy`: 移除不需要的依赖项，并将依赖项列表写入 `go.mod` 文件。
>     -   `go mod vendor`: 将依赖项复制到项目的 vendor 目录中。
>     -   `go mod download`: 下载模块的依赖项。
>     -   `go mod verify`: 校验模块的依赖项。
>     -   `go mod graph`: 打印模块依赖图。
>     -   `go mod why`: 解释为什么需要特定的依赖项。
>     -   `go mod edit`: 编辑模块的 go.mod 文件。
>     -   `go mod tidy -v`: 显示详细的日志信息。
>     -   `go mod init <module-path>`: 初始化一个新的 Go 模块，并指定模块路径。
>
> ***