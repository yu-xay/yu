####
1. 属性的可枚举性 enumerable
2. super 当前对象的原型对象
3. 解构赋值

#### 部分函数
1. Object.is();  //一是+0不等于-0，二是NaN等于NaN
2. Object.assign() //浅拷贝 复制的值是一个取值函数，那么将求值后再复制
    //为属性指定默认值 为对象添加属性
3. Object.getOwnPropertyDescriptors()  返回对象的描述
4. Object.setPrototypeOf(object, prototype) Object.getPrototypeOf() Object.create() 代替__proto__
5, Object.keys() Object.values Object.entries()
6. Object.fromEntries()方法是Object.entries()的逆操作 用于将一个键值对数组转为对象