# FROM php:apache-stretch
FROM php:7.2-apache
# 注意copy的文件夹中文件不用通配符
COPY ./upload/ /var/www/html/

RUN sed -i "s@deb.debian.org@mirrors.aliyun.com@g" /etc/apt/sources.list && \
    apt-get update \
        && apt-get install -y \
          gcc g++ \
          libfreetype6-dev \
          libjpeg62-turbo-dev \
          libmcrypt-dev \
          libpng-dev \
        && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \ 
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install mysqli \
    && cd /var/www/html/ \
    && chmod a+w -R config data uc_server/data uc_client/data install \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80
