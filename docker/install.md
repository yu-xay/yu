###Windows10 Home
1. [Windows版Docker桌面](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
2. [Linux 内核更新包](https://docs.microsoft.com/zh-cn/windows/wsl/wsl2-kernel)
3. [镜像加速器](https://cr.console.aliyun.com/cn-beijing/instances/mirrors "https://tn7yhbvq.mirror.aliyuncs.com")

###Virtualbox
+ docker-machine ip default

#### [html Code]
> + Q: System.InvalidOperationException: 无法正常启动
     ![安装异常](http://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWcyMDIwLmNuYmxvZ3MuY29tL2Jsb2cvMTE0OTEvMjAyMDA2LzExNDkxLTIwMjAwNjA4MTY0MTM2NjU1LTE2ODAwMDE4MzEucG5n)
> + A: 
>   + shell> netsh winsock reset  
>
> + Q: 证书错误
> + A:
>   + 更新下证书位置 C:\Users\aoyun\.docker\machine\certs
>
>+ Q: 192.165.32.33之类的 没授权之类的错误
>+ A:
>   + 之前装虚拟机卸载后命令行冲突了
>   + 删除DOCKER 相关环境 重装软件即可
>
> + Q: 启动保存 an error occurred
> + A:
>   + shell> bcdedit /set hypervisorlaunchtype Auto