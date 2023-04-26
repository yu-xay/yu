####http协议
- 应用层

#### ip协议
- 网络层协议
- 负责调用本地网络协议将数据包传送至下一个网关或目的主机
- 实现寻址和分段 ip负责选择传送的道路（路由功能），
- 服务类型。 由网关使用，用于在特定的网络，或是用于下下一个要经过的网络，或是下一个要对这个数据包进行路由的网关上选择实际的传送参数
- 生存时间。 由发送者设置，由经过路由的地方处理。如果未到达时生存时间为零，抛弃此数据包
- 选项。包括时间戳，安全和特殊路由
- 报头校验码。 保证数据的正确传输。如果校验出错，抛弃整个数据包。
- ip传输必须要有明确的ip地址,才能进行数据发送

#### TCP
- 传输层协议 面向连接的、可靠的、基于字节流的
- 三次握手
    - 客户端发送SYN报文，进入SYN_SEND(发送)状态
    - 服务器接收SYN报文，回应SYN ACK 报文 进入SYN_RECV(接收)状态
    - 客户端收到服务器端的SYN报文 校验成功后回应ACK报文 进入Established(已确认)状态
    - 服务端这时接受到客户端的ACK信息校验成功后(K与K+1)，不再返回信息，后面进入数据通讯阶段
- 连接成功
    - 传输的数据被tcp分割成了最适合发送的数据块 传递给ip协议,这个发送数据称为 报文段 或 段
    - tcp作为可靠性连接,每次发送数据段,会启动一个定时器,每次接收数据段,会发送一次确认,如果定时器没有及时收到确认,则会重发数据
    - TCP将保持它首部和数据的检验和。这是一个端到端的检验和，目的是检测数据在传输过程中的任何变化。如果收到段的检验和有差错，TCP将丢弃这个报文段和不确认收到此报文段（希望发端超时并重发）
    - 两个应用程序通过TCP连接交换8bit字节构成的字节流。TCP不在字节流中插入记录标识符。我们将这称为字节流服务（bytestreamservice）
- 四次握手(关闭 finish) 半关闭造成的 
    - 客户端主动关闭（active close） 发送FIN分节，（TCP连接只有一方发送了FIN,另一方没有发出FIN包,仍然可以在一个方向上正常发送数据）
    - 服务端接受到信息后，首先返回ACK(M+1),表明自己已经收到消息
    - 服务端在准备好关闭之前，最后发送给客户端一个 FIN(N)消息，询问客户端是否准备好关闭了
    - 客户端接受到服务端发送的消息后，返回一个确认信息: ACK(N+1)
    - 最后，服务端和客户端在双方都得到确认时，各自关闭或者回收对应的TCP链接。
#### UDP
  - udp是无连接协议,不需要进行tcp的握手
  - UDP 丢包相比tcp 严重
  - UDP 可靠性差
  - udp每次发送最大长度是65535,而tcp在握手后可以源源不断的发送
####HTTP
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






























