### Generator
+ yield 表达式 
    - 遇到yield表达式，暂停执行后面的操作 并返回后面的值 作为返回对象的value值
    - 调用next方法，内部指针指向该语句才会执行 惰性求值
    - 用着另外一个表达式中，必须放在圆括号里面
        - console.log('He' + (yield 'llo'));
        - func(field 'hello');
        
+ Iterator 关系
    + 对象都存在 Symbol.iterator 方法 等于该对象的遍历器生成函数
    + generator 本身就是遍历器生成函数
    + generator[Symol.iterator]() === generator
+ Next()
    + yield 总返回undefined next 可以携带一个参数 作为上一个yield表达式的返回值
    + 无法第一次调用 输入参数
+ 可使用for...of循环 扩展运算符 解构赋值 Array.from

+ func
    + Generator.prototype.throw() => generator().throw('抛出异常')
    * 需要next()启动, throw 被捕获之后 会附带执行下一个yield表达式
    * 内部执行出错了没有捕获， 此后再调用next 将返回{value:undefined,done:false}
    
    + Generator.prototype.return()
    + 返回给定值 终结函数 g.return('end');
    + 会先调用finlly 里面 等到finally代码块执行完，再返回return()方法指定的返回值
+ yield* 表达式
    + 想当于 yield** func()  for(let i of func()){yield i}
    + 只要有iterator接口 就能被yield遍历
    + call 用来调用所有者对象作为参数的方法。
+ 应用
    + for...of 本质是while循环 (while res.done);
    + 控制流管理 
    + 异步操作的同步化表达 => 业务逻辑封装在一个函数，按部就班非常清晰
    + 部署Iterator接口 =》可任意对象上部署 Iterator 接口
### 异步应用
    
































