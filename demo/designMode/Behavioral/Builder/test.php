<?php declare(strict_types=1);

namespace DesignMode\Behavioral\Builder;

use DesignMode\Behavioral\Builder\Parts\Car;
use DesignMode\Behavioral\Builder\Parts\Truck;
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