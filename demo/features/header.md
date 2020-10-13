HTTP 
+ Content-Type: 定义网络文件的类型和网页的编码 告诉客户端实际返回的内容的内容类型
    + header('Content-Type:text/html;charset=utf-8');
    + [对照表](https://www.runoob.com/http/http-content-type.html)
    + 常用
        + text/html HTML格式
        + text/plain 纯文本格式
        + text/xml   XML格式
        + image/gif  gif图片格式
        + image/jpeg jpg图片格式
        + image/png  png图片格式
        
        + application/xml   XML数据格式
        + application/json JSON数据格式
        + application/pdf  pdf格式
        + application/msword Word文档格式
        + application/octet-stream 二进制流数据（如常见的文件下载）
        + multipart/form-data 需要在表单中进行文件上传时，就需要使用该格式

+ header('HTTP/1.1 404 Not Found')     设置头部
+ header('Location: http://baidu.com') 转向一个新地址
+ header('Content-Length: 1334') 设置内容长度
+ header('Accept-Ranges: bytes') 安装字节大小返回 浏览器可能会尝试恢复中断的下载，而不是从头再次开始 或ie9 用none来禁用下载或暂停
+ header('Content-Disposition: attachment; filename=文件') 意味着消息体应该被下载到本地
+ [HTTP状态码](http://www.verydoc.net/http/00004364.html)



