<?php
file_put_contents('my-errors.log', '');
error_log(json_encode($_GET,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
error_log(json_encode($_POST,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
error_log(json_encode(file_get_contents('php://input'),JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
error_log(json_encode(getallheaders(),JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");

