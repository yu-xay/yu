<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Behavioral\Prototype;


/**
 * 相比正常创建一个对象 (new Foo () )，首先创建一个原型，然后克隆它会更节省开销。
 * 用于创建对象成本过高时
 */
class Prototype
{
    private $num = 10;

    public function less()
    {
        $this->num = $this->num - 1;
        return $this->num;
    }

    public function __clone()
    {
        // TODO: Implement __clone() method.
    }

    public function getPrototype()
    {
        return clone $this;
    }
}