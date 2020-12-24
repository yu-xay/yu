:### linux 常用命令

5. 远程复制文件或者文件夹：
  - 复制本地到远程： scp [-r] local_path username@ip:path
  - 复制远程到本地： scp [-r] username@ip:path local_path

9. 变更文件所属用户或用户组： chown owner:group [file/folder]

11. 查看文件：
 - 输出文件内容：cat [filename]
 - tail [-f:实时输出文件内容] [filename]
 - less
12. 查找内容：
 - grep [正则]
 - awk
13. 建立软链： ln -s [realpath/filename] [realpath]
14. 查看包含所有用户的进程：ps -aux
15. 查看端口： netstat -anp
 - a代表：显示所有，默认不显示LISTEN的
 - n代表：不显示数字别名
 - p代表：显示关联的程序
16. 压缩
 - 解压缩：tar -zxvf [filename]
 - 压缩：tar -zcvf [filename]
17. 查看当前命令所在的路径: which
18. 查看当前用户
  - who
  - whoami
19. 查看当前系统运行多长时间：uptime
20. 可读性好的查看磁盘空间：df -h
21. 可读性好的查看文件空间：du -f --max-depth=[遍历文件夹的深度] [file/folder]
22. debian添加软件源：apt-add-repository [源]
23. 查找文件：
 - find [path] -name  [filename]
 - find [path] -user  [owername]
 - find [path] -group [groupname]
25. 进程：
 - 杀掉进程：kill [pid]
 - 查看进程
        * 查看：ps -aux
        * 查看父进程ID(ppid)：ps -ef
26. 关机/重启
 - 关机：shutdown -h now
 - 关机: init 0
 - 关机: halt
 - 关机: poweroff
 - 重启: shutdown -r now reboot
: