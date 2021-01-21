<?php


namespace DesignMode\Behavioral\Command;


class Drinks extends Command
{
    public function execute()
    {
        return $this->cook->createDrink();
    }
}