FROM php:7.4-fpm
WORKDIR "/application"

COPY . /usr/local/etc/php/conf.d/
# http://i.chaoxing.com/ xia1846721817
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
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip wget net-tools \
    ## 下载GD扩展
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    ## 下载reids扩展
    && curl --referer https://i.chaoxing.com/ -L -o /tmp/redis.tar.gz https://d0.ananas.chaoxing.com/download/e68fb98805f957732458c8269604ca15 \
    ## && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.3.2.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-5.3.2 /usr/src/php/ext/redis \
    ## 下载swoole扩展
    && curl --referer https://i.chaoxing.com/ -L -o /tmp/swoole-src.tar.gz https://d0.ananas.chaoxing.com/download/cf41f0bf15bdb2e134f24ec26c7714f6 \
    ## && curl -L -o /tmp/swoole-src.tar.gz https://github.com/swoole/swoole-src/archive/v4.5.9.tar.gz \
    && tar xfz /tmp/swoole-src.tar.gz \
    && rm -r /tmp/swoole-src.tar.gz \
    && mv swoole-src-4.5.9 /usr/src/php/ext/swoole \
    ## 安装PHP扩展
    && docker-php-ext-install pdo pdo_mysql gd bcmath redis pcntl swoole \
    ## find /* -name php-config
    ## && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
    ## && cd /usr/src/php/ext/swoole && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make && make install
    ## 安装composer
    && wget --referer=https://i.chaoxing.com/ https://d0.ananas.chaoxing.com/download/25b534d48d88fd8a15a557916cd5b35e -O composer.phar \
    ## && wget https://github.com/composer/composer/releases/download/2.0.7/composer.phar \
    && chmod u+x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    ## 修改composer镜像
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer