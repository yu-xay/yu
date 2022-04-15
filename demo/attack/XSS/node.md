#### XSS 跨站脚本攻击
原理： 恶意攻击者往 Web 页面里插入恶意可执行网页script代码，当用户浏览该页之时，嵌入其中 Web 里面的脚本代码会被执行，从而可以达到攻击者盗取用户信息或其他侵犯用户安全隐私的目的。

防御
    + 字符串转义
    + 字符过滤
    + 输入检查
    + http only js脚本无法读取cookie
#####分类
反射型：非持久型XSS，交互数据一般
[XSS攻击](https://www.jianshu.com/p/2818a8b75aed)



















#### pit ####
[indexHTML](https://developer.mozilla.org/zh-CN/docs/Web/API/Element/innerHTML);
```javascript
const name = "John";
// assuming 'el' is an HTML DOM element
document.innerHTML = name; // harmless in this case

// ...

name = "<script>alert('I am John in an annoying alert!')</script>";
document.innerHTML = name; // harmless in this case
```

尽管这看上去像 cross-site scripting 攻击，结果并不会导致什么。HTML 5 中指定不执行由 innerHTML 插入的 <script> 标签。
然而，有很多不依赖 <script> 标签去执行 JavaScript 的方式。所以当你使用innerHTML 去设置你无法控制的字符串时，这仍然是一个安全问题。例如：
```javascript
const name = "<img src='x' onerror='alert(1)'>";
document.innerHTML = name; // shows the alert
```
