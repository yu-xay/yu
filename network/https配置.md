###使用windows10 wamp apache mkcert###
1. [mkcert](http://caiyun.feixin.10086.cn/dl/175Cjf9LVi9ol "lpuT https://github.com/FiloSottile/mkcert/releases")
2. "mkcert-v1.4.1-windows-amd64.exe" rename "mkcert.exe";
3. 打开cmd 执行 mkcert -install => mkcert localhost 127.0.0.1 ::1;
4. 生成"localhost+2.pem" "localhost+2-key.pem"
5. "localhost+2.pem" rename "server.crt"; "localhost+2-key" rename "server.key"
6. cmd 打开 apache2.4/bin目录执行检测 'httpd -t' => Syntax OK (正常) *
7.
```$xslt
Q SSLSessionCache: 'shmcb' session cache not supported
A LoadModule socache_shmcb_module modules/mod_socache_shmcb.so
Q Invalid command 'SSLCipherSuite', perhaps misspelled or defined by a module not included in the serv
A LoadModule ssl_module modules/mod_ssl.so

httpd.conf
    LoadModule ssl_module modules/mod_ssl.so
    LoadModule socache_shmcb_module modules/mod_socache_shmcb.so
    Include conf/extra/httpd-ssl.conf
```
8.httpd-ssl.conf
```apacheconfig
<VirtualHost _default_:443>

#   General setup for the virtual host
DocumentRoot "C:/wamp/www"
ServerName locahost:443
ServerAdmin admin@example.com
ErrorLog "${SRVROOT}/logs/error.log"
TransferLog "${SRVROOT}/logs/access.log"

#   SSL Engine Switch:
#   Enable/Disable SSL for this virtual host.
SSLEngine on

#   Server Certificate:
#   Point SSLCertificateFile at a PEM encoded certificate.  If
#   the certificate is encrypted, then you will be prompted for a
#   pass phrase.  Note that a kill -HUP will prompt again.  Keep
#   in mind that if you have both an RSA and a DSA certificate you
#   can configure both in parallel (to also allow the use of DSA
#   ciphers, etc.)
#   Some ECC cipher suites (http://www.ietf.org/rfc/rfc4492.txt)
#   require an ECC certificate which can also be configured in
#   parallel.
SSLCertificateFile "${SRVROOT}/conf/server.crt"
#SSLCertificateFile "${SRVROOT}/conf/server-dsa.crt"
#SSLCertificateFile "${SRVROOT}/conf/server-ecc.crt"

#   Server Private Key:
#   If the key is not combined with the certificate, use this
#   directive to point at the key file.  Keep in mind that if
#   you've both a RSA and a DSA private key you can configure
#   both in parallel (to also allow the use of DSA ciphers, etc.)
#   ECC keys, when in use, can also be configured in parallel
SSLCertificateKeyFile "${SRVROOT}/conf/server.key"
#SSLCertificateKeyFile "${SRVROOT}/conf/server-dsa.key"
#SSLCertificateKeyFile "${SRVROOT}/conf/server-ecc.key"

#   Server Certificate Chain:
#   Point SSLCertificateChainFile at a file containing the
#   concatenation of PEM encoded CA certificates which form the
#   certificate chain for the server certificate. Alternatively
#   the referenced file can be the same as SSLCertificateFile
#   when the CA certificates are directly appended to the server
#   certificate for convenience.
SSLCertificateChainFile "${SRVROOT}/conf/server.crt"
```
8.重启apache




###使用openssl自签 
+ [OpenSSL](https://www.openssl.org/docs/man1.0.2/man1/openssl-ca.html)
+ [OpenSSL 生成自签证书](https://blog.51cto.com/stuart/2310166) (麻烦未测试不推荐)
