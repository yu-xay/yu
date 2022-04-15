<?php

namespace DesignMode\Behavioral\Memento;

class Ticket
{
    public $m;

    public function __construct()
    {
        $this->m = new State(State::S_START);
    }

    public function start()
    {
        return new State(State::S_START);
    }

    public function end()
    {
        return new State(State::S_END);
    }

    public function getInfo()
    {
        return $this->m;
    }

    public function save(Ticket $ticket)
    {
        return new Memento(clone $ticket);
    }

    public function undo(Memento $memento)
    {
        return $memento->getState();
    }


}