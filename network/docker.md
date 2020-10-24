+ docker-machine ip default

+ [官网](https://docs.docker.com/docker-for-windows/install-windows-home/)


docker cp C:\Users\yu\Desktop\default.conf 9d3cc192f0f6:/etc/nginx/conf.d/default.conf
docker run --name me_php -d -v D:/wamp/www:/var/www/html php:7.4-fpm
docker run --name me_nginx -p 9091:80 -d -v D:/wamp/www:/usr/share/nginx/html -v D:/wamp/bin/docker/conf.d:/etc/nginx/conf.d --link me_php:php nginx



https://blog.csdn.net/weixin_42665727/article/details/80996408

https://blog.csdn.net/mysticboy/article/details/106632922




