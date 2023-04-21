FROM php:7.2-fpm
WORKDIR "/application"

## @see http://mirrors.ustc.edu.cn/help
## https://sourceforge.net/projects/yu-download/files/ account.sakura-a pass.0182
# ARG DEBIAN=bullseye
# ARG SWOOLE=5.0.2
# ARG XDEBUG=3.2.0
ARG DEBIAN=buster
ARG SWOOLE=4.8.13
ARG XDEBUG=3.1.6
ARG REDIS=5.3.7
ARG IMAGICK=3.7.0
ARG COMPOSER=2.5.5

COPY . /usr/local/etc/php/conf.d/
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    ##### 更换镜像 #####
    && echo " " > /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian/ ${DEBIAN} main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian/ ${DEBIAN} main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian/ ${DEBIAN}-updates main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian/ ${DEBIAN}-updates main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian/ ${DEBIAN}-backports main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian/ ${DEBIAN}-backports main contrib non-free " >> /etc/apt/sources.list \
    ## && echo "deb http://mirrors.ustc.edu.cn/debian-security/ ${DEBIAN}-security main contrib non-free " >> /etc/apt/sources.list \
    ## && echo "deb-src http://mirrors.ustc.edu.cn/debian-security/ ${DEBIAN}-security main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian-security/ ${DEBIAN}/updates main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian-security/ ${DEBIAN}/updates main contrib non-free " >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get clean \
    #################### 安装系统工具 ####################
    && apt-get install -y nano libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip wget net-tools libzip-dev \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >> /etc/timezone \
    #################### 安装PHP扩展 ####################
    && docker-php-ext-install mysqli pdo pdo_mysql bcmath pcntl zip \
    #################### 安装GD扩展 ####################
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    ## && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
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
    #################### 修改GIF别名 ####################
    && apt-get install -y nano git \
    && git config --global core.autocrlf input \
    && git config --global alias.s status \
    && git config --global alias.b branch \
    && git config --global alias.c checkout \
    && git config --global alias.p pull \
    && git config --global alias.d diff \
    #################### 安装composer #################### \
    && wget https://ghproxy.com/https://github.com/composer/composer/releases/download/${COMPOSER}/composer.phar \
    ## && wget https://master.dl.sourceforge.net/project/yu-download/extensions/composer.phar?viasf=1 -O composer.phar \
    && chmod u+x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer

EXPOSE 18306
    ## 手动编译安装
    ## find /* -name php-config
    ## && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
    ## && cd /usr/src/php/ext/swoole && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make && make install