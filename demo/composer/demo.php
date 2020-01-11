<?php

namespace yu\composer;

use ckg\src\Tools;
use PHPUnit\Framework\TestCase;
use yu\composer\auto\car;

class customize
{
    public function __construct()
    {
        require_once '../../vendor/autoload.php';
        include __DIR__ . '/autoload.php';
    }

    public function test()
    {
        car::setWheel();
    }
}

$a = new customize();
$a->test();


class demo extends TestCase
{
    public function __construct()
    {
        return parent::__construct();
    }

    protected function setUp(): void
    {
        require_once '../../vendor/autoload.php';
        include __DIR__ . '/autoload.php';
    }

    public function testPushAndPop()
    {
        $a = new Tools();
        $this->expectOutputString('Hello World');
        $a::Hello();
    }

    public function testAutoload()
    {
        $auto = new car();
        //dcd() 不会触发 spl_autoload_register phpunit问题 ↑
        $this->assertSame('wheel', car::setWheel());
        $this->assertSame('CREATE', $auto->create());
    }

    public function testError()
    {
        trigger_error('抛出错误', E_USER_ERROR);
        die('错误处理');
    }

    /**
     * todo phpunit 与之冲突
     */
    public function testException()
    {
        throw new Exception('hello world!');
        die('异常处理');
    }
}

?>