<?php declare(strict_types=1);

namespace DesignMode\Behavioral\Builder;

use DesignMode\Behavioral\Builder\Parts\Vehicle;

/**
 * 简单对象构建复杂对象
 * 基本组件不变，但是组件之间的组合方式善变
 */
interface Builder
{
    public function createVehicle();

    public function addWheel();

    public function addEngine();

    public function addDoors();

    public function getVehicle(): Vehicle;
}
