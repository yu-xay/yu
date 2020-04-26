####百度搜索 apache Directory
```
基于主机名
127.0.0.1 admin.com

<VirtualHost *:80>
     DocumentRoot "C:/wamp/www/zjhj_mall_v4"
     ServerName admin.com
</VirtualHost>
```

```
基于端口
listen 8081
<VirtualHost *:8081>
    DocumentRoot "C:/wamp/www/zjhj_mall_v4"
    <Directory "C:/wamp/www/zjhj_mall_v4">
        Options Indexes FollowSymLinks
        AllowOverride None
    </Directory>
</VirtualHost>
```

```
基于IP(同理)
```