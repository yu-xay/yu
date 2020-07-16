<?php

$class = new class {
    public function downPng()
    {
        ob_start();
        $file = '1.jpg';
        readfile($file);
        header('Content-type: application/octet-stream');
        header('Content-Disposition: attachment; filename=2.jpg');
        ob_flush();
        flush();
    }

    //https://learnku.com/php/t/39751
    public function downBigFile()
    {
        set_time_limit(0);
        header("Content-type: application/pdf");
        header('Accept-Ranges:bytes');
        header('Content-Disposition: attachment; filename=2.pdf');
        $file = "1.pdf";
        $header_array = get_headers($file, true);
        $filesize = $header_array['Content-Length'];
        header('Accept-Length:' . $filesize);
        $fp = fopen($file, "r") ; //将filename指定的名字资源绑定到一个流上
        while (!feof($fp)) { //测试文件指针是否到了文件结束的位
            $buff = fread($fp, 1024); //读取文件 可安全用于二进制文件
            print_r($buff);
        }
        fclose($fp);
    }
};
$class->downBigFile();
