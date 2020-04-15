###[SSH密钥指南](https://help.github.com/articles/generating-ssh-keys)

(基本待测试)
1. ls -al ~/.ssh => 查看SSH密钥
2. ssh-keygen -t rsa -b 4096 -C "your_email@example.com" => 本地新增SSH密钥
3. ssh-add ~/.ssh/id_rsa => SSH 私钥添加到 ssh-agent (控制用来保存公钥身份验证所使用的私钥的程序)
4. clip < ~/.ssh/id_rsa.pub => 密钥复制剪贴板
5. github.com: setting => SSH and GPG keys => New SSH key => copy to key => Add SSH key => 保存
6. ssh -T git@github.com => 验证
