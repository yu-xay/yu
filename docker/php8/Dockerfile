FROM php:8.2-fpm
WORKDIR "/application"

COPY . /usr/local/etc/php/conf.d/
# https://sourceforge.net/projects/yu-download/files/ account.sakura-a pass.0182
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get clean \
    ## 安装系统工具 #####
    && apt-get install -y nano libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip wget net-tools libzip-dev \
    ## 安装PHP扩展
    && docker-php-ext-install mysqli pdo pdo_mysql bcmath pcntl zip \
    ######################################################## GD \
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    ## && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd \
    ######################################################## redis
    && curl -L -o /tmp/redis.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/phpredis-5.3.7.tar.gz?viasf=1 \
    ## && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.3.7.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-5.3.7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    ######################################################## swoole
    && curl -L -o /tmp/swoole-src.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/swoole-src-5.0.1.tar.gz?viasf=1 \
    ## && curl -L -o /tmp/swoole-src.tar.gz https://github.com/swoole/swoole-src/archive/v5.0.1.tar.gz \
    && tar xfz /tmp/swoole-src.tar.gz \
    && rm -r /tmp/swoole-src.tar.gz \
    && mv swoole-src-5.0.1 /usr/src/php/ext/swoole \
    && docker-php-ext-install swoole \
    ## find /* -name php-config
    ## && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
    ## && cd /usr/src/php/ext/swoole && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make && make install
    ######################################################## imagick
    && apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev \
    && curl -L -o /tmp/imagick.tar.gz https://master.dl.sourceforge.net/project/yu-download/extensions/imagick-3.7.0.tar.gz?viasf=1 \
    ## && curl -L -o /tmp/imagick.tar.gz https://github.com/Imagick/imagick/archive/refs/tags/3.7.0.tar.gz \
    && tar xfz /tmp/imagick.tar.gz \
    && rm -r /tmp/imagick.tar.gz \
    && mv imagick-3.7.0 /usr/src/php/ext/imagick \
    && docker-php-ext-install imagick \
    ######################################################## GIT
    && apt-get install -y nano git \
    && git config --global core.autocrlf input \
    && git config --global alias.s status \
    && git config --global alias.b branch \
    && git config --global alias.c checkout \
    && git config --global alias.p pull \
    && git config --global alias.d diff \
    ######################################################## composer
    && wget https://master.dl.sourceforge.net/project/yu-download/extensions/composer.phar?viasf=1 -O composer.phar \
    ## && wget https://github.com/composer/composer/releases/download/2.4.4/composer.phar \
    && chmod u+x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer

EXPOSE 18306
## 下载Xdebug扩展
#    && curl -L -o /tmp/xdebug-3.1.5.tar https://xdebug.org/files/xdebug-3.1.5.tgz \
#    && tar xfz /tmp/xdebug-3.1.5.tar \
#    && rm -r /tmp/xdebug-3.1.5.tar \
#    && mv xdebug-3.1.5 /usr/src/php/ext/xdebug \
#    && docker-php-ext-install xdebug \