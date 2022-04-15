<?php
declare(strict_types=1);

namespace DesignMode\Behavioral\Memento;

class Memento
{
    private $ticket;

    public function __construct(Ticket $ticket)
    {
        $this->ticket = $ticket;
    }

    public function getState()
    {
        return $this->ticket;
    }
}