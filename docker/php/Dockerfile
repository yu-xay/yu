FROM php:7.4-fpm
WORKDIR "/application"

COPY . /usr/local/etc/php/conf.d/

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo " " > /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get clean \
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev vim procps cron zip unzip \
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.3.2.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-5.3.2 /usr/src/php/ext/redis \
    && docker-php-ext-install pdo pdo_mysql gd bcmath redis pcntl
    #apt-get install wget
    #wget https://github.com/composer/composer/releases/download/2.0.7/composer.phar
    #修改为可执行
    chmod u+x composer.phar
    #复制到/usr/local/bin/ 这样就可以直接运行composer 命令
    #mv composer.phar /usr/local/bin/composer
    #修改仓库地址为阿里云
    #composer config -g repo.packagist composer https://mirrors.aliyun.com/composer


#CMD service cron start
# Install selected extensions and other stuff
# RUN apt-get update \
#    && apt-get -y --no-install-recommends install  php-memcached php7.4-mysql php7.4-pgsql php-redis php7.4-gd \
#    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

## Install git
#RUN apt-get update \
#    && apt-get -y install git \
#    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*