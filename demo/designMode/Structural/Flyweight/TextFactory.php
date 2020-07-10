<?php declare(strict_types=1);

namespace DesignMode\Creational\Flyweight;

use Countable;

/**
 * 工厂类会管理分享享元类，客户端不应该直接将他们实例化。
 * 但可以让工厂类负责返回现有的对象或创建新的对象。
 */
class TextFactory implements Countable
{
    /**
     * 定义享元特征数组。
     * 用于存储不同的享元特征。
     */
    private array $charPool = [];

    /**
     * 输入字符串格式数据 $name。
     * 返回 CharacterFlyweight 对象。
     */
    public function get(string $name): Text
    {
        if (!isset($this->charPool[$name])) {
            $this->charPool[$name] = $this->create($name);
        }

        return $this->charPool[$name];
    }

    private function create(string $name): Text
    {
        if (strlen($name) == 1) {
            return new Character($name);
        } else {
            return new Word($name);
        }
    }

    /**
     * 返回享元特征个数。
     */
    public function count(): int
    {
        return count($this->charPool);
    }
}
