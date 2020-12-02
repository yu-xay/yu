FROM php:8.0.0-fpm
WORKDIR "/application"

COPY . /usr/local/etc/php/conf.d/

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    ## 更换镜像
    && echo " " > /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get clean \
    ## 安装系统工具
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip wget \
    ##下载GD扩展
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    ##下载reids扩展
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.3.2.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-5.3.2 /usr/src/php/ext/redis \
    ##安装PHP扩展
    && docker-php-ext-install pdo pdo_mysql gd bcmath redis pcntl \
    ##安装composer
    && wget https://github.com/composer/composer/releases/download/2.0.7/composer.phar \
    && chmod u+x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    ##修改composer镜像
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer