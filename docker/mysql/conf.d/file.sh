#!/bin/bash

# Q 可能文件权限过高 会导致无法加载
chmod 664 "./docker.cnf" \
    && chmod 664 "./mysql.cnf"

# MySQL(5.7.19)的默认配置文件是 /etc/mysql/my.cnf 文件。
# 如果想要自定义配置，建议向 /etc/mysql/conf.d 目录中创建 .cnf 文件。
# 新建的文件可以任意起名，只要保证后缀名是 cnf 即可。新建的文件中的配置项可以覆盖 /etc/mysql/my.cnf 中的配置项。
# [mysqld]
