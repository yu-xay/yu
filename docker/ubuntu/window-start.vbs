Dim wsh
Set wsh = CreateObject("Wscript.shell")

wscript.sleep 0
wsh.run """C:\Program Files\Docker\Docker\Docker Desktop.exe"""
wsh.run """D:\App\PhpStorm 2022.3.1\bin\phpstorm64.exe"""
wsh.run """D:\app\WeChat\WeChat.exe"""
wsh.run """D:\app\WXWork\WXWork.exe"""
wsh.run """C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"" --new-window https://localhost/zjhj_mall_v4 https://tower.im/members/f90e8dda704b4c61a58f4618e2e9a50d/todos/uncompleted/"
wsh.run """D:\App\Clash for Windows\Clash for Windows.exe"""
wsh.run """D:\App\Telegram Desktop\Telegram.exe"""
wscript.sleep 60000
wsh.run """C:\WINDOWS\system32\wsl.exe"" -d Ubuntu --cd /root sh a"
wscript.quit