1. [官网文档](https://docs.docker.com/docker-for-windows/install-windows-home/)



https://blog.csdn.net/wt1286331074/article/details/91425518

docker run -itd --name me-mysql -p 3311:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
docker run --name me-php -d -v C:/wamp/www:/var/www/html php:7.4-fpm
docker run --name me-nginx -p 9090:80 -d -v C:/wamp/www:/usr/share/nginx/html -v C:/wamp/bin/docker/conf.d:/etc/nginx/conf.d --link me-php:php nginx

https://blog.csdn.net/lypeng_/article/details/98175906



