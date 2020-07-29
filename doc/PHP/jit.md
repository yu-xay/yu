+ [JIT](https://learnku.com/php/t/44968)
+ [执行流程](https://blog.csdn.net/diavid/article/details/81035188)

####PHP代码执行过程
1. Scanning(Lexing/Tokenize) 将php代码转换成语言片段(Tokens);
2. Parsing                   将Tokens转换成简单而有意义的表达式AST
3. Compilation               将表达式编译成Opacode
4. Execution                 顺次执行Opacode，从而实现PHP脚本的功能