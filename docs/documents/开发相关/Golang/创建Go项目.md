# 创建go项目

> 设置go的环境变量  - 2023·06/27 04:29
>
> ***
>
> > #### 随处创建项目 使用go.mod可以使项目不依赖go path固定目录
> >
> > ```shell
> >🐶~/Desktop/Projects/SM > go env   
> >                        
> > GO111MODULE="on"
> > GOARCH="amd64"
> > GOBIN="/Users/solo/Developer/Languages/go/bin"
> > GOCACHE="/Users/solo/Library/Caches/go-build"
> > GOENV="/Users/solo/Library/Application Support/go/env"
> > GOEXE=""
> > GOEXPERIMENT=""
> > GOFLAGS=""
> > GOHOSTARCH="amd64"
> > GOHOSTOS="darwin"
> > GOINSECURE=""
> > GOMODCACHE="/Users/solo/Developer/Projects/Golang-Projects/pkg/mod"
> > GONOPROXY=""
> > GONOSUMDB=""
> > GOOS="darwin"
> > GOPATH="/Users/solo/Developer/Projects/Golang-Projects"
> > GOPRIVATE=""
> > GOPROXY="https://mirrors.aliyun.com/goproxy/,direct"
> > GOROOT="/Users/solo/Developer/Languages/go"
> > GOSUMDB="sum.golang.org"
> > GOTMPDIR=""
> > GOTOOLDIR="/Users/solo/Developer/Languages/go/pkg/tool/darwin_amd64"
> > GOVCS=""
> > GOVERSION="go1.20.2"
> > GCCGO="gccgo"
> > GOAMD64="v1"
> > AR="ar"
> > CC="clang"
> > CXX="clang++"
> > CGO_ENABLED="1"
> > GOMOD="/Users/solo/Desktop/Projects/SM/go.mod"
> > GOWORK=""
> > CGO_CFLAGS="-O2 -g"
> > CGO_CPPFLAGS=""
> > CGO_CXXFLAGS="-O2 -g"
> > CGO_FFLAGS="-O2 -g"
> > CGO_LDFLAGS="-O2 -g"
> > PKG_CONFIG="pkg-config"
> > GOGCCFLAGS="-fPIC -arch x86_64 -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/78/2gb078115qsbmg1vf_jzm6j80000gn/T/go-build3883679618=/tmp/go-build -gno-record-gcc-switches -fno-common"
> > ```

> 完整创建项目详解
>
> -   详细操作
>     1.  创建文件
>         ```go
>         mkdir SM
>         cd SM && touch main.go
>         go mod init SM
>         go mod tidy
>         mkdir -p ./ch3/model/test && cd ./ch3/model/test && touch t.go
>
>         ```
>     2.  t.go
>         ```go
>         package test
>
>         import "fmt"
>
>         func T() {
>           fmt.Println("T方法")
>         }
>
>         ```
>     3.  main.go
>         ```go
>         test.T()
>
>         ```
>     4.  保存将会自动引入包
>     5.  打包
>         ```bash
>         go build -ldflags "-s -w" -o main
>         ```