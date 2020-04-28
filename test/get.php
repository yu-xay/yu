<?php

$a = getallheaders();
//error_log(json_encode($a,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");

error_log(json_encode(array_merge($_GET,$_POST),JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");