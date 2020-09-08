<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Registry;

//注册表
class Registry
{
    const TIME_A = '1';
    private static $storage;
    private static $define = [
        self::TIME_A
    ];

    public static function save($key, $value)
    {
        if (in_array($key, static::$define)) {
            static::$storage[$key] = $value;
        }
    }

    public static function get($key)
    {
        if (in_array($key, static::$define) && isset($key, static::$storage)) {
            return static::$storage[$key];
        }
    }
}
