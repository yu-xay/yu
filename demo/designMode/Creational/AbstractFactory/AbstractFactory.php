<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\AbstractFactory;

/***
 * 在不指定具体类的情况下创建一系列相关或依赖对象。
 * 通常创建的类都实现相同的接口。
 * 抽象工厂的客户并不关心这些对象是如何创建的，它只是知道它们是如何一起运行的。
 *
 * 多个类 有 接口性 的区分
 * 相比简单工厂 多了2个接口
 */
interface AbstractFactory
{
    public function createCsvWriter(): CsvWriter;

    public function createJsonWriter(): JsonWriter;
}