### 安装nodejs npm
+ [nodejs + npm](https://nodejs.org/en/download)

```
cd /opt \
&& version="20.4.0" \
&& wget https://nodejs.org/dist/v"$version"/node-v"$version"-linux-x64.tar.xz \
&& tar -xJf node-v"$version"-linux-x64.tar.xz -C ./ \
&& rm -rf /usr/bin/node \
&& rm -rf /usr/bin/npm \
&& rm -rf /opt/node-v"$version"-linux-x64.tar.xz \
&& sudo ln -s /opt/node-v"$version"-linux-x64/bin/node /usr/bin/node \
&& sudo ln -s /opt/node-v"$version"-linux-x64/bin/npm /usr/bin/npm \
&& echo 'install success'
```

[link](https://blog.csdn.net/weixin_36343850/article/details/79217611)
```cron
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 
* * * * * /application/zjhj_mall_v4/queue.sh
```

### 校准时间

+ sudo apt-get install ntpdate
+ sudo ntpdate time.windows.com
+ sudo hwclock --localtime --systohc