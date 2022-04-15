<?php declare(strict_types=1);

namespace DesignMode\Creational\Builder;

use DesignMode\Creational\Builder\Parts\Car;
use DesignMode\Creational\Builder\Parts\Truck;
use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testCanBuildTruck()
    {
        $truckBuilder = new TruckBuilder();
        $newVehicle = (new Director())->build($truckBuilder);

        $this->assertInstanceOf(Truck::class, $newVehicle);
    }

    public function testCanBuildCar()
    {
        $carBuilder = new CarBuilder();
        $newVehicle = (new Director())->build($carBuilder);

        $this->assertInstanceOf(Car::class, $newVehicle);
    }
}