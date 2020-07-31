+ [JIT](https://learnku.com/php/t/44968)
+ [执行流程](https://blog.csdn.net/diavid/article/details/81035188)

####PHP代码执行过程
1. Scanning(Lexing/Tokenize) 将php代码转换成语言片段(Tokens);单词符号
2. Parsing                   将Tokens转换成简单而有意义的表达式AST(抽象语法树)
3. Compilation               将抽象语法树编译成Opacode 操作码
4. Execution                 顺次执行Opacode，从而实现PHP脚本的功能
5. zend Vm                   Zend VM引擎 接收操作码 并执行


+ [底层](https://www.cnblogs.com/shixiuxian/p/11230939.html)
###JIT
+ 在运行时进行编译是昂贵的
+ 跳过zend vm 编译成 机器码
+ [PHP 8新特性之JIT简介](https://www.laruence.com/2020/06/27/5963.html)

![介绍](https://www.laruence.com/medias/2020/06/Screen-Shot-2020-06-28-at-18.31.57.png "")