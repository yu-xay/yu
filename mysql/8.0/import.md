#### 恢复
###操作
+ [BACKUP]: backup.sql
+ [OPTIONS]: mysql -u <user> -p <pass> -P <PORT> -h <remote_hostname>
- shell> cat [BACKUP] | [OPTIONS]  可远程
- shell> [OPTIONS]  < [BACKUP]
- shell> (echo "SET SQL_LOG_BIN = 0;"; cat [BACKUP]) | [OPTIONS]  不希望恢复过程写入二进制
- mysql> set sql_log_bin=0;  source [BACKUP]  会话中关闭恢复过程写入二进制

#### 建议
    + 可在linux 下 screen 会话内启动恢复过程，
    + --force 遇到错误继续
    
### myloader 恢复
    + 是多线程恢复mydumper备份集的工具

### 普通文件恢复 
    + shell> sudo systemctl stop mysql
    + shell> sudo mv /backup/mysql /var/lib
    + shell> sudo chown -R mysql:mysql /var/lib/mysql
    + shell> sudo systemctl start mysql

### 执行时间点恢复
    