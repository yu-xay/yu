FROM php:7.4-fpm
WORKDIR "/application"

COPY . /usr/local/etc/php/conf.d/
# http://i.chaoxing.com/ xia1846721817
# https://sourceforge.net/projects/yu-download/files/ account.sakura-a pass.0182
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
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip wget net-tools libzip-dev \
    ## 下载GD扩展
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    ## && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    ## 下载reids扩展
    && curl -L -o /tmp/redis.tar.gz https://master.dl.sourceforge.net/project/yu-download/phpredis-5.3.3.tar.gz?viasf=1 \
    ## && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.3.3.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-5.3.3 /usr/src/php/ext/redis \
    ## 下载swoole扩展
    && curl -L -o /tmp/swoole-src.tar.gz https://master.dl.sourceforge.net/project/yu-download/swoole-src-4.6.4.tar.gz?viasf=1 \
    ## && curl -L -o /tmp/swoole-src.tar.gz https://github.com/swoole/swoole-src/archive/v4.6.4.tar.gz \
    && tar xfz /tmp/swoole-src.tar.gz \
    && rm -r /tmp/swoole-src.tar.gz \
    && mv swoole-src-4.6.4 /usr/src/php/ext/swoole \
    ## 安装PHP扩展
    && docker-php-ext-install pdo pdo_mysql gd bcmath redis pcntl swoole zip \
    ## find /* -name php-config
    ## && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
    ## && cd /usr/src/php/ext/swoole && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make && make install
    ## 安装composer
    && wget https://master.dl.sourceforge.net/project/yu-download/composer.phar?viasf=1 -O composer.phar \
    ## && wget https://github.com/composer/composer/releases/download/2.0.11/composer.phar \
    && chmod u+x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    ## 修改composer镜像
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer

EXPOSE 18306

## 下载imageick
#    && apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev
#    && pecl install imagick
#    && docker-php-ext-enable imagick

## 下载Xdebug扩展
#    && curl -L -o /tmp/xdebug-3.0.1.tar https://xdebug.org/files/xdebug-3.0.1.tgz \
#    && tar xfz /tmp/xdebug-3.0.1.tar \
#    && rm -r /tmp/xdebug-3.0.1.tar \
#    && mv xdebug-3.0.1 /usr/src/php/ext/xdebug \
#    && docker-php-ext-install xdebug \