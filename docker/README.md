+ ### [docs文档](https://docs.docker.com/docker-for-windows/install-windows-home/)
+ ### [博客](https://www.cntofu.com/book/139/image/dockerfile/healthcheck.md)
+ ### [cli文档](https://docs.docker.com/engine/reference/commandline/cli/)


- #### wsl -l -v
- #### wsl --export docker-desktop D:\App\Ubuntu-ext4\docker-desktop.tar
- #### wsl --export docker-desktop-data D:\App\Ubuntu-ext4\docker-desktop-data.tar
- #### wsl --unregister docker-desktop
- #### wsl --unregister docker-desktop-data
- #### wsl --import docker-desktop D:\App\Ubuntu-ext4\docker-desktop D:\App\Ubuntu-ext4\docker-desktop.tar
- #### wsl --import docker-desktop-data D:\App\Ubuntu-ext4\docker-desktop-data D:\App\Ubuntu-ext4\docker-desktop-data.tar
- #### del D:\App\Ubuntu-ext4\docker-desktop.tar
- #### del D:\App\Ubuntu-ext4\docker-desktop-data.tar
- #### wsl --shutdown

- #### 清理无容器使用的镜像 docker system prune -a
- #### 修剪容器 docker system prune --volumes
- #### 获取IP docker network inspect docker_default