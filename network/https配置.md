###使用openssl自签 
####[OpenSSL 生成自签证书](https://blog.51cto.com/stuart/2310166)
####[OpenSSL](https://www.openssl.org/docs/man1.0.2/man1/openssl-ca.html)

###创建一个自签的根证书
+ step1: openssl genrsa -out prikey2020.pem 2048 创建私钥
+ step2: openssl req -new -x509 -key prikey2020.pem -out ca_cert_server2048.crt -days 365 使用私钥生成根证书
```
    Country Name (2 letter code) [AU]:CN    //输入一个国家的名字，两字母代码  可为空
    State or Province Name (full name) [Some-State]:BeiJing  //州或省名称 ，全名   可为空
    Locality Name (eg, city) []:BeiJing  //地区名称，如城市  可为空
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Devops  //组织名称，默认有限公司 可为空
    Organizational Unit Name (eg, section) []:certDevops //组织单元名称 ，可为空  
    Common Name (e.g. server FQDN or YOUR name) []:www.linuxplus.com
    Email Address []:admin@linuxplus.com   //邮件地址，可为空

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:yuiofpajfpaijfwjfp    //输入密码
    An optional company name []:yu    //输入一个公司的名称
```
+ step3: openssl x509 -in ca_cert_server2048.crt -text 查看根证书

###创建一个证书申请
+ step4: openssl genrsa -out cert_prikey2019.pem 2048 创建一个私钥
+ step5: openssl req  -new  -key cert_prikey2019.pem  -out cert.csr 再生成一个证书申请

+ step6: openssl x509 -req -days 730 -sha384 -CA ca_cert_server2048.crt -CAkey prikey2020.pem -CAcreateserial -in cert.csr -out cert.crt 使用自签的根证书对证书申请进行签署
+ step7: openssl x509 -in cert.crt -text 查看签署的自签证书

###创建私钥 CA 管理机构
