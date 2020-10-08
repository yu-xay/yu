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
+ 生成唯一值 
+ description 
+ let obj = {
    [s](arg) { ... }
  };
+ Object.getOwnPropertySymbols() 获取Symbol键名
+ Reflect.ownKeys() 返回所有键名 包括 Symbol键名
+ Symbol.for(key) 登记key到全局 =》 模块的单列模式
+ Symbol.keyFor(key) 获取登记名称
+ 提供了 11 个内置的 Symbol 值，指向语言内部使用的方法


#### Set和Map数据结构
+ new Set([])
    + add(value) delete(value) has(value) clear() size
    + 不会发生类型转换 3 和 ‘3’ =》 内部 === 判断
    + 两个空对象不相等，所以它们被视为两个值
    + Array.from() 可使转为数组 或 [...new Set(arr)]
    + 遍历结构: keys()  values() entries()键值对
    + Set键名和键值是同一个值 所以 keys() 和 values() 基本一致
    + new Set([...a].filter(x => b.has(x))) 交集
+ new WeakSet() 只能放对象 弱引用  不会引发内存泄漏。

+ new Map() 相比于Object结构 提供了 [值-值]的对应
    + 构造成员是 键值对组成的二维数组 ([key, value]) => map.set(key, value)
    + set(key,value) size get(key) has(key) delete(key) clear()
    + 只有对同一个对象的引用 map才认为是同一个键(内存地址)*
    + Map 的键实际上是跟内存地址绑定的*
    + [...Map] 即可转数组
    + Object.entries({"a":1, "b":2}) Object.create(null)
+ new WeakMap() 只接受对象作为键名 并且键名指向对象，不计入垃圾回收机制

####Proxy

####Reflect

####Promise

####Iterator和 for...of 
+ Iterator 
    + 各种数据结构，提供一个统一的、简便的访问接口
    + 本质上是 指针 next 返回 value done


















































