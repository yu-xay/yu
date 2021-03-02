<?php
declare(strict_types=1);

namespace DesignMode\Behavioral\Memento;
class State
{
    public const S_START = 'start';
    public const S_END = 'end';

    public $status = '';

    public function __construct($status)
    {
        $this->status = $status;
        //do something
    }
}