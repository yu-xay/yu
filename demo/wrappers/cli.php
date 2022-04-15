<?php

// >a.txt | 1>b.txt | 2>c.txt | 1> d.txt 2>&1
function testStdin()
{
    //$data = fgets(STDIN);
    $data = fread(STDIN, 1);
    echo $data;
}
//控制台输出标准信息 标准输出 只写
function testStdOut()
{
    fwrite(STDOUT, '写入的内容');
    fclose(STDOUT);
}
//控制台输出错误信息 错误输出 只写
function testStdErr()
{
    fwrite(STDERR, '错误信息');
    fclose(STDERR);
}
echo 'ECHO';
//testStdin();
//testStdOut();
//testStdErr();
