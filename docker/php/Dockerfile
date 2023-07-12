ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm

ARG SWOOLE
ARG XDEBUG
ARG REDIS
ARG IMAGICK
ARG COMPOSER

## @see https://mirrors.ustc.edu.cn/help/debian.html
## hhttps://mirrors.ustc.edu.cn/help/debian.htmlttps://sourceforge.net/projects/yu-x/ account.sakura-a pass.
WORKDIR "/application"

RUN echo "Building Docker image..." \
    #################### 更换镜像 ####################
    && if awk 'BEGIN{exit ARGV[2]>=ARGV[1]}' ${PHP_VERSION} 8.2; then \
            cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak; \
            sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
            sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources; \
        else \
            cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
            sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list; \
            sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list; \
        fi \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get clean \
    && rm -r /bin/sh && ln -s /bin/bash /bin/sh \
    #################### 安装系统工具 ####################
    && apt-get install -y systemd nano libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip wget net-tools libzip-dev \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >> /etc/timezone \
    #################### 安装PHP扩展 ####################
    && docker-php-ext-install mysqli pdo pdo_mysql bcmath pcntl zip \
    #################### 安装GD扩展 ####################
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && if awk 'BEGIN{exit ARGV[2]>=ARGV[1]}' ${PHP_VERSION} 7.4; then \
            docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2; \
        else \
            docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/; \
        fi \
    && docker-php-ext-install gd \
    #################### 安装Redis扩展 ####################
    && curl -L -o /tmp/redis.tar.gz https://ghproxy.com/https://github.com/phpredis/phpredis/archive/${REDIS}.tar.gz \
    ## && curl -L -o /tmp/redis.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/phpredis-${REDIS}.tar.gz?viasf=1 \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-${REDIS} /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    #################### 安装imagick扩展 ####################
    && apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev \
    && curl -L -o /tmp/imagick.tar.gz https://ghproxy.com/https://github.com/Imagick/imagick/archive/refs/tags/${IMAGICK}.tar.gz \
    ## && curl -L -o /tmp/imagick.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/imagick-${IMAGICK}.tar.gz?viasf=1 \
    && tar xfz /tmp/imagick.tar.gz \
    && rm -r /tmp/imagick.tar.gz \
    && mv imagick-${IMAGICK} /usr/src/php/ext/imagick \
    && docker-php-ext-install imagick \
    #################### 安装Swoole扩展 ####################
    && curl -L -o /tmp/swoole-src.tar.gz https://ghproxy.com/https://github.com/swoole/swoole-src/archive/v${SWOOLE}.tar.gz \
    ## && curl -L -o /tmp/swoole-src.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/swoole-src-${SWOOLE}.tar.gz?viasf=1 \
    && tar xfz /tmp/swoole-src.tar.gz \
    && rm -r /tmp/swoole-src.tar.gz \
    && mv swoole-src-${SWOOLE} /usr/src/php/ext/swoole \
    && docker-php-ext-install swoole \
    #################### 安装Xdebug扩展 ####################
    && curl -L -o /tmp/xdebug-${XDEBUG}.tar https://xdebug.org/files/xdebug-${XDEBUG}.tgz \
    && tar xfz /tmp/xdebug-${XDEBUG}.tar \
    && rm -r /tmp/xdebug-${XDEBUG}.tar \
    && mv xdebug-${XDEBUG} /usr/src/php/ext/xdebug \
    && docker-php-ext-install xdebug \
    #################### 统一开关 ####################
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-imagick.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-redis.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-gd.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-pcntl.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-sodium.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-zip.ini \
    #################### 修改GIF别名 ####################
    && apt-get install -y git \
    && git config --global core.autocrlf input \
    && git config --global alias.s status \
    && git config --global alias.b branch \
    && git config --global alias.c checkout \
    && git config --global alias.p pull \
    && git config --global alias.d diff \
    && git config --global pull.rebase false \
    && git config --global core.autocrlf input \
    #################### 安装composer #################### \
    && wget https://ghproxy.com/https://github.com/composer/composer/releases/download/${COMPOSER}/composer.phar \
    ## && wget https://master.dl.sourceforge.net/project/yu-download/extensions/composer.phar?viasf=1 -O composer.phar \
    && chmod u+x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    ## composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
    && composer config -g repo.packagist composer https://mirrors.cloud.tencent.com/composer/

EXPOSE 18306
    ## 手动编译安装
    ## find /* -name php-config
    ## && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
    ## && cd /usr/src/php/ext/swoole && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make && make install