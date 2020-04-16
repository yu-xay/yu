####一次网络请求
```$xslt
domain
|
dns -> ip
|
CDN ↑
|
http  -> http(headers[common{request url/request method/status code/remote address}/request{accetp/accept-encoding/accept-language/connection/cookie/host/pragma/user-agent/referer}/response{cache-control/expires/content-type/connection/keep-alive/server}]/body[]) -> headers\r\n隔开、headers和body\r\n\r\n隔开 -> 所以实现http协议\r\n\r\n分割可以得到headers和body，headers\r\分割可以得到头的各个信息
|
tcp -> 建立连接(三次握手[syn/syn&ack/ack]) -> 断开链接(四次握手[fin/ack/fin/ack])
|
ip -> 找到远程机器
|
内网
|
ARP -> mac地址
```
## HTTP 报文

HTTP 报文由三部分组成:
- Start Line
- Headers
- Entity Body

HTTP 报文分为两类:
- 请求报文
- 响应报文

### 请求报文Start Line

语法 : <方法> <请求URL> <版本>

#### HTTP Method
+ get: 获取资源，不携带http body,支持查询参数，大小2kb
+ post: 传输资源， http body, 大小默认8m（浏览器相关），1000个input variable
+ put： 传输资源， http body，要求前端提供的一定是一个完整的资源对象
+ patch： 传输资源， http body, 局部更新，后端仅更新接收到的字段
+ delete: 传输资源 不携带http body
+ head：获取http header，不携带http body
+ connect：建立隧道通信
+ options： 获取支持的method， 不携带http body
+ trace：追踪，返回请求回环信息，不携带http body

### 响应报文Start Line

语法 : <方法> <状态码> <原因短语>

#### HTTP Status Code
[http状态码](https://www.runoob.com/http/http-status-codes.html)
+ 2XX：成功状态码
+ 301：永久重定向
+ 302：临时重定向
+ 304： not modified,返回缓存，和重定向无关
+ 307: 临时重定向,严格不从post到get
+ 400: 参数错误
+ 401：未通过http认证
+ 403：forbidden,未授权
+ 404：not found，不存在资源
+ 405：Method Not Allowed 客户端请求的方法被禁止
+ 500：internet server error，代码错误
+ 502: bad gateway，错误网关
+ 503: service unavailable，服务不可用
+ 504：gateway timeout， fastcgi(接口)响应超时

## HTTPs
HTTPS 认证流程

## Websocket

+ 基于http协议建立连接，header的upgrade字段转化协议为websocket
+ 全双工通信，客户端建立连接

## HTTP2

+ 多路复用：多个请求共享一个tcp连接
+ 全双工通信
+ 必须https://
+ 头部压缩
+ 二进制传输






























