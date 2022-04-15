<?php declare(strict_types=1);

namespace DesignMode\Structural\Flyweight;

/**
 * 这是所有flyweight都需要实现的接口
 */
interface Text
{
    public function render(string $extrinsicState): string;
}
