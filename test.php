<?php
function test(){
    echo "ok";
}
function test2(callable $call){
    $call();
}
test2('testx');