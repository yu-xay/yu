<?php


namespace DesignMode\Behavioral\State;


class OrderContext
{
    public StateCreated $state;

    public function __construct()
    {
        $this->state = new StateCreated();
    }

    public function proceedToNext()
    {
        $this->state->proceedToNext($this);
    }

    public function setState($state)
    {
        $this->state = $state;
    }
}