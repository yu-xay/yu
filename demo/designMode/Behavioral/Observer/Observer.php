<?php


namespace DesignMode\Behavioral\Observer;


use SplSubject;

class Observer implements \SplObserver
{
    public $s;

    public function __construct($s)
    {
        $this->s = $s;
    }

    public function update(SplSubject $subject)
    {
        return '通知' . $this->s;
        // TODO: Implement update() method.
    }
}