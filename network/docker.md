+ docker-machine ip default

+ [官网](https://docs.docker.com/docker-for-windows/install-windows-home/)


docker cp C:\Users\yu\Desktop\default.conf 9d3cc192f0f6:/etc/nginx/conf.d/default.conf



docker run -itd --name me-mysql -p 3311:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
docker run --name me-php -d -v D:/wamp/www:/var/www/html php:7.4-fpm
docker run --name me-nginx -p 80:80 -d -v D:/wamp/www:/usr/share/nginx/html -v D:/wamp/bin/docker/conf.d:/etc/nginx/conf.d --link me-php:php nginx



https://blog.csdn.net/weixin_42665727/article/details/80996408

https://blog.csdn.net/mysticboy/article/details/106632922




