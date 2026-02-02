1. 进程启动命令 (Start Processes)
   启动特定进程： supervisorctl start <进程名>
   启动所有进程： supervisorctl start all
   启动组内进程： supervisorctl start <组名>:*
2. 状态与配置管理命令 (Status & Config)
   查看状态： supervisorctl status
   重新加载配置文件并添加新进程： supervisorctl update
   重新加载配置并重启所有（慎用）： supervisorctl reload
   重新读取配置但不重启： supervisorctl reread
3. 停止与重启命令 (Stop & Restart)
   停止特定进程： supervisorctl stop <进程名>
   停止所有进程： supervisorctl stop all
   重启特定进程： supervisorctl restart <进程名>
   重启所有进程： supervisorctl restart all 