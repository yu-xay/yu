<?php
namespace DesignMode\Behavioral\StaticFactory;

/**
 * 使用一个静态方法来创建所有类型对象
 * Note1: Remember, static means global state which is evil because it can't be mocked for tests
 * Note2: Cannot be subclassed or mock-upped or have multiple different instances.
 */
final class StaticFactory
{
    /**
     * @param string $type
     *
     * @return FormatterInterface
     */
    public static function factory(string $type): FormatterInterface
    {
        if ($type == 'number') {
            return new FormatNumber();
        } elseif ($type == 'string') {
            return new FormatString();
        }
        throw new \InvalidArgumentException('Unknown format given');
    }
}
