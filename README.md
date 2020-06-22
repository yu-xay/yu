# yu
待处理文档
1. php攻击（6种攻击详解）
2. [CSS3](https://www.w3school.com.cn/css3/css3_border.asp) 
3. MYSQL 优化
- [中文](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/optimize-overview.html#%E4%BC%98%E5%8C%96%E6%A6%82%E8%BF%B0)
- [英文](https://dev.mysql.com/doc/refman/5.7/en/optimization-indexes.html)



ORM 对象关系映射工具
### heredoc语法
### 魔术常量
### ftp 和 sftp
### [mysql优化章](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/optimize-overview.html#%E4%BC%98%E5%8C%96%E6%A6%82%E8%BF%B0)

wechat pay

###### [文档](https://pay.weixin.qq.com/wiki/doc/api/index.html)
###### [开发流程](https://pay.weixin.qq.com/wiki/doc/api/H5.php?chapter=15_4)

`````````
####### ssh多ssh-key管理(场景：在同一台开发机器上开发着公司的项目，又维护者自己的github开源项目，这时候为了安全和区分我们就需要在一台机器上维护多个ssh-key)

- step 1: ssh-keygen -t rsa -C "tigerbcode@gmail.com" -f ~/.ssh/github
- step 2: 创建config文件到~/.ssh

```demo
# github

Host github.com
Hostname github.com
User git
Identityfile ~/.ssh/github
```

- step 3: less ~/.ssh/github.pub (添加公钥)
- step 4: ssh -T github.com

`````````




[PHP 内核与原生扩展开发](https://learnku.com/docs/php-internals/php7)