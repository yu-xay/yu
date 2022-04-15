<?php declare(strict_types=1);

namespace DesignMode\Creational\AbstractFactory;

use PHPUnit\Framework\TestCase;

/**
 * * 说说我理解的工厂模式和抽象工厂模式的区别：
 *  工厂就是一个独立公司，负责生产对象；
 *  抽象工厂就是集团，负责生产子公司（工厂）；
 */
class test extends TestCase
{
    public function testUnix()
    {
        $json = new UnixWriterFactory();
        $class = $json->createCsvWriter();
        $this->assertInstanceOf(CsvWriter::class, $class);
    }

    public function testWin()
    {
        $json = new WinWriterFactory();
        $class = $json->createJsonWriter();
        $this->assertInstanceOf(JsonWriter::class, $class);
    }
}