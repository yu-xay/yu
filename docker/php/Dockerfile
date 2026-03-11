ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm

ARG SWOOLE
ARG XDEBUG
ARG REDIS
ARG IMAGICK
ARG COMPOSER

## Debian镜像 https://mirrors.ustc.edu.cn/help/debian.html
## sourceforge下载源 https://sourceforge.net/projects/yu-download/files/ account.sakura-a pass.0182
WORKDIR "/application"

RUN echo -e "当前 PHP 版本 ${PHP_VERSION}开始构建"
#################### 更换镜像 ####################
RUN if awk 'BEGIN{exit ARGV[2]>=ARGV[1]}' ${PHP_VERSION} 8.2; then \
        cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak; \
        sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
        sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources; \
     else \
        cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
        sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list; \
        sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list; \
     fi
RUN apt-get update
RUN apt-get -y upgrade
RUN rm -r /bin/sh && ln -s /bin/bash /bin/sh
#################### 安装系统工具 ####################
RUN apt-get install -y --no-install-recommends nano vim procps cron zip unzip wget net-tools libzip-dev iputils-ping
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >> /etc/timezone
#################### 安装Laravel依赖 ####################
RUN apt-get install -y supervisor
#################### 安装PHP扩展 ####################
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath pcntl zip sockets
#################### 安装GD扩展 ####################
RUN apt-get install -y --no-install-recommends libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev
RUN docker-php-source extract
RUN cd /usr/src/php/ext/gd
RUN if awk 'BEGIN{exit ARGV[2]>=ARGV[1]}' ${PHP_VERSION} 7.4; then \
        docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2; \
    else \
        docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/; \
    fi
RUN docker-php-ext-install -j$(nproc) gd
#################### 安装intl扩展 ####################
RUN apt-get install -y --no-install-recommends libicu-dev
RUN docker-php-ext-install -j$(nproc) intl
#################### 安装imagick扩展 ####################
RUN apt-get install -y --no-install-recommends libmagickwand-dev libmagickcore-dev
RUN curl -L -o /tmp/imagick.tar.gz https://ghfast.top/https://github.com/Imagick/imagick/archive/refs/tags/${IMAGICK}.tar.gz
## RUN curl -L -o /tmp/imagick.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/imagick-${IMAGICK}.tar.gz?viasf=1
RUN tar xfz /tmp/imagick.tar.gz
RUN rm -r /tmp/imagick.tar.gz
RUN mv imagick-${IMAGICK} /usr/src/php/ext/imagick
RUN docker-php-ext-install -j$(nproc) imagick
#################### 安装Redis扩展 ####################
RUN curl -L -o /tmp/redis.tar.gz https://ghfast.top/https://github.com/phpredis/phpredis/archive/${REDIS}.tar.gz
## RUN curl -L -o /tmp/redis.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/phpredis-${REDIS}.tar.gz?viasf=1
RUN tar xfz /tmp/redis.tar.gz
RUN rm -r /tmp/redis.tar.gz
RUN mv phpredis-${REDIS} /usr/src/php/ext/redis
RUN docker-php-ext-install -j$(nproc) redis
#################### 安装Swoole扩展 ####################
RUN apt-get install -y --no-install-recommends libssl-dev
RUN curl -L -o /tmp/swoole-src.tar.gz https://ghfast.top/https://github.com/swoole/swoole-src/archive/v${SWOOLE}.tar.gz
## RUN curl -L -o /tmp/swoole-src.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/swoole-src-${SWOOLE}.tar.gz?viasf=1
RUN tar xfz /tmp/swoole-src.tar.gz
RUN rm -r /tmp/swoole-src.tar.gz
RUN mv swoole-src-${SWOOLE} /usr/src/php/ext/swoole
RUN docker-php-ext-install -j$(nproc) swoole
#################### 安装Xdebug扩展 ####################
RUN curl -L -o /tmp/xdebug-${XDEBUG}.tar https://xdebug.org/files/xdebug-${XDEBUG}.tgz
RUN tar xfz /tmp/xdebug-${XDEBUG}.tar
RUN rm -r /tmp/xdebug-${XDEBUG}.tar
RUN mv xdebug-${XDEBUG} /usr/src/php/ext/xdebug
RUN docker-php-ext-install -j$(nproc) xdebug
#################### 统一开关 ####################
RUN rm -rf /usr/local/etc/php/conf.d/docker-php-ext-*.ini
#################### Git配置 ####################
RUN apt-get install -y --no-install-recommends git && \
    git config --global core.autocrlf input && \
    git config --global pull.rebase false && \
    git config --global alias.s status && \
    git config --global alias.b branch && \
    git config --global alias.c checkout && \
    git config --global alias.p pull && \
    git config --global alias.d diff
#################### 安装composer ####################
RUN wget https://ghfast.top/https://github.com/composer/composer/releases/download/${COMPOSER}/composer.phar
## RUN wget https://master.dl.sourceforge.net/project/yu-download/extensions/composer.phar?viasf=1 -O composer.phar
RUN chmod u+x composer.phar
RUN mv composer.phar /usr/local/bin/composer
## RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
RUN composer config -g repo.packagist composer https://mirrors.cloud.tencent.com/composer/
#################### 清理 ####################
RUN apt-get clean
RUN docker-php-source delete
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /usr/src/php
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

EXPOSE 80/tcp
    ## 手动编译安装
    ## RUN find /* -name php-config
    ## RUN cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4
    ## RUN cd /usr/src/php/ext/swoole && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make && make install