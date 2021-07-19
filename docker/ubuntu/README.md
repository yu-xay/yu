### 更换源

+ cp /etc/apt/sources.list /etc/apt/sources.list.backup
+ cp sources.list /etc/apt/sources.list
+ sudo apt-get update

### GIT

+ git config --global core.autocrlf input

### 安装nodejs npm

+ http://nodejs.cn/download/ 安装nodejs npm
+ wget https://npm.taobao.org/mirrors/node/v14.15.0/node-v14.15.0-linux-x64.tar.xz
+ sudo apt remove npm
+ sudo apt remove node
+ cd /usr/local/bin
+ tar -xJf node-v14.15.0-linux-x64.tar.xz -C /opt
+ sudo ln -s /opt/node-v14.16.1-linux-x64/bin/node /usr/bin/node
+ sudo ln -s /opt/node-v14.16.1-linux-x64/bin/npm /usr/bin/npm

### 校准时间

+ sudo apt-get install ntpdate
+ sudo ntpdate time.windows.com
+ sudo hwclock --localtime --systohc