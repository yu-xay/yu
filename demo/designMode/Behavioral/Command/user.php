<?php


namespace DesignMode\Behavioral\Command;


class user
{
    public waiter $waiter;

    public function __construct(waiter $waiter)
    {
        $this->waiter = $waiter;
    }

    public function eat($value)
    {
        $this->waiter->add($value);
    }

    public function run(){
        return $this->waiter->run();
    }

}