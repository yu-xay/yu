<?php

namespace yu\composer;

use ckg\src\Tools;
use PHPUnit\Framework\TestCase;
use yu\composer\auto\tt;


class StackTest extends TestCase
{
    public function __construct()
    {
        return parent::__construct();
    }

    protected function setUp(): void
    {
        require_once '../../vendor/autoload.php';
    }

    public function testPushAndPop()
    {
        $a = new Tools();
        $this->expectOutputString('Hello World');
        $a::Hello();
    }

    public function testTt()
    {
//        spl_autoload_register(['Yii', 'autoload'], true, true);
//        Yii::$classMap = require __DIR__ . '/classes.php';
//        Yii::$container = new yii\di\Container();
        include './One.php';
        spl_autoload_register(['One', 'autoload']);
//        spl_autoload_register(function ($class) {
//            include './auto/tt.php';
//        });
        $this->assertSame('1', '1');
        $a = new tt();
        echo $a->index();
    }
}

?>