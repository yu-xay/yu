CSRF: 跨站域请求伪造
条件： 
    + 必须一个网站生成cookie凭证存储在浏览器中，
    + 该cookie没有清楚，客户端又tab一个页面访问 别的网址
    
CSRF：防御
    1. 验证HTTP Referer字段
    2. 请求地址添加token验证
    3. HTTP头部添加token验证，使用XMLHttpRequest请求
