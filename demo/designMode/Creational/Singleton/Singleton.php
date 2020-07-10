<?php declare(strict_types=1);
namespace DesignMode\Creational\Singleton;

/**
 * 在应用程序调用的时候，只能获得一个对象实例。
 */
final class Singleton
{
    private static $model;

    public static function getModel()
    {
        if (empty(self::$model)) {
            self::$model = new static();
        }
        return self::$model;
    }

    private function __wakeup()
    {
        // TODO: Implement __wakeup() method.
    }

    private function __clone()
    {
        // TODO: Implement __clone() method.
    }

    private function __construct()
    {
    }
}