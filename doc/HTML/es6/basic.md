###[ES6](https://es6.ruanyifeng.com/)

#####变量的解析赋值
+ 模式匹配
+ 不完全解构 为 undefined
+ let [x = 1] = [undefined]; 惰性求值

+ 对象赋值 是先找到同名属性 再赋给对应的变量
+ let { foo: baz } = { foo: 'aaa', bar: 'bbb' }; 不同名情况
+ foo是匹配的模式，baz才是变量。真正被赋值的是变量baz，而不是模式foo。
+ let x; ({x} => {x :1 }) 圆括号问题 => 只要有可能导致解构的歧义，就不得使用圆括号
+ 变量声明语句，模式不能使用圆括号
+ 函数也可应用解析赋值
+ 用途 1：交换值 2：返回多值 3 函数参数可定义多值 默认值  4 输入模块的指定方法

#### 字符串的扩展
+ 可用Unicode表示字符
+ 模板字符串 ${} 即可嵌入变量
+ 实例：模板编译 xxx
+ 模板标签 紧跟在一个函数名后面，该函数将被调用来处理这个模板字符串
   + 第一个参数是一个数组，该数组的成员是模板字符串中那些没有变量替换的部分 *
   + 其他参数，都是模板字符串各个变量被替换后的值
   +  raw属性，保存的是 [转义后]的原字符串
   + 可过滤 HTML 字符串
   + 多语言转换
```javascript
let msg = passthru`The total is ${total} (${total*1.05} with tax)`;
function passthru(literals) {
  let result = '';
  let i = 0;

  while (i < literals.length) {
    result += literals[i++];
    if (i < arguments.length) {
      result += arguments[i];
    }
  }

  return result;
}
```

#### 数值的扩展
+ 二进制ob 八进制0o
+ 函数
    + Number.isFinite()
    + Number.isNaN()
    + Number.isInteger()
+ 安全整数 整数范围在-2^53到2^53之间（不含两个端点）
    + Number.MAX_SAFE_INTEGER
    + Number.MIN_SAFE_INTEGER
    + Number.isSafeInteger()  一个整数是否落在这个范围之内
+ Math
    + Math.trunc() 去除小数点
    + Math.sign()  正数、负数、还是零
+ 。。。
    
#### 函数的扩展
+ 参数默认值不是传值的，而是每次都重新计算默认值表达式的值
+ undefined 代表不传值
+ 'use strict'; 函数内部可以设定为严格模式。
+ name属性，返回该函数的函数名。
+ 箭头函数
#### 数组的扩展
+ spread ...
#### 对象的扩展

#### 对象的新增方法
+ Object.is() 基本同 === 不同之处只有两个：一是+0不等于-0，二是NaN等于自身。
+ Object.assign() 对象属性值为简单类型（string，number）为深拷贝 属性值为对象或其他引用类型 则为浅拷贝

#### Symbol
+ 