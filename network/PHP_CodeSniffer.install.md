[参考](https://qq52o.me/2448.html)
```
phpstorm 2020.1;
php 7.2.14
```
1. [go-pear](https://pear.php.net/go-pear.phar)

2. 下载go-pear.phar至php目录

3. 执行php go-pear.phar

4. 
```
Name of configuration file         :c:\windows\pear.ini 配置文件
Path to Cli php.exe                :c:\wamp\bin\php\php7.2.14 需配置php目录
```

5.回车安装后PHP 目录下会多出来一些文件夹，如 www，pear 等等

6.pear -h 检查pear安装

7.pearinstall PHP_CodeSniffer

8.安装成功后 目录有 phpcbf，phpcbf.bat 和 phpcs，phpcs.bat 文件

9. 
```test
phpstorm 设置 => Setting->Languages and Frameworks->PHP->Code Sniffer
点那个 3 个点的按钮，在 PHP Code Sniffer (phpcs) Path 选项挑选 CodeSniffer 的执行文件，在 PHP 安装目录下，我的是
D:\phpStudy\php\php-7.0.12-nts\phpcs.bat
```
10. 
```test
、Setting->Editor->Inspections->PHP Code Sniffer validation 勾选上，然后在右边的 Coding standard 按下刷新按钮，成功的话点击下拉按钮就会有可供选择的标准
```

