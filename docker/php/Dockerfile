FROM php:7.4-fpm
WORKDIR "/application"

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo " " > /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free " >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >> /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev \
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2 \
    && docker-php-ext-install pdo pdo_mysql gd bcmath

# Install selected extensions and other stuff
#RUN apt-get update \
#    && apt-get -y --no-install-recommends install  php-memcached php7.4-mysql php7.4-pgsql php-redis php7.4-gd \
#    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

## Install git
#RUN apt-get update \
#    && apt-get -y install git \
#    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*