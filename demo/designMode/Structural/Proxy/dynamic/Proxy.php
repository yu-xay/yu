<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Proxy\dynamic;

class Proxy
{
    public $namespace; //

    public $methods;//方法体

    public $handler;//处理类
    public $reflection; //反射类

    public function __construct($reflection, $handler)
    {
        $this->namespace = $reflection->getNamespaceName() . $reflection->getName();
        $methods = $reflection->getMethods(\ReflectionMethod::IS_PUBLIC);
        foreach ($methods as &$method) {
            $method = $method->getName();
        }
        unset($method);
        $this->methods = $methods;
        $this->handler = $handler;
        $this->reflection = $reflection;
    }

    public static function newProxyInstance($object, $handler)
    {
        return new self(new \ReflectionObject($object), $handler);
    }

    public static function createProxy($real, $proxy)
    {
        return new self((new \ReflectionClass($real)), $proxy);
    }

    public function __call($name, $arguments)
    {
        if (in_array($name, $this->methods)) {
            return $this->handler->invoke($name, $arguments);
        }
    }
}
