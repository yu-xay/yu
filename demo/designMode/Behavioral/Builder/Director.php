<?php declare(strict_types=1);

namespace DesignMode\Behavioral\Builder;

use DesignMode\Behavioral\Builder\Parts\Vehicle;

/**
* Director是构建器模式的一部分。它知道建造者的界面
 *并在构建器的帮助下构建一个复杂的对象
 *
 *您也可以注入许多构建器而不是一个来构建更复杂的对象
 */
class Director
{
    public function build(Builder $builder): Vehicle
    {
        $builder->createVehicle();
        $builder->addDoors();
        $builder->addEngine();
        $builder->addWheel();

        return $builder->getVehicle();
    }
}
