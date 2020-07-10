<?php

declare(strict_types=1);

namespace DesignMode\Structural\Facade;

class RoastChicken implements Chicken
{
    public function name()
    {
        return '烤鸡';
    }
    public function eat()
    {
        return 'goods';
    }
}
