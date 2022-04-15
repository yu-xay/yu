Dim wsh
set wsh=createobject("Wscript.shell")

wscript.sleep 0
wsh.run """C:\Program Files\Docker\Docker\Docker Desktop.exe"""
wsh.run """C:\Users\Administrator\PhpStorm 2020.3\bin\phpstorm64.exe"""
wsh.run """D:\app\WeChat\WeChat.exe"""
wsh.run """D:\app\WXWork\WXWork.exe"""

wscript.quit