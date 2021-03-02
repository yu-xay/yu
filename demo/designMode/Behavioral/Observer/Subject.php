<?php


namespace DesignMode\Behavioral\Observer;


use SplObserver;

class Subject implements \SplSubject
{

    public $all = [];

    public function attach(SplObserver $observer)
    {
        array_push($this->all, $observer);
        // TODO: Implement attach() method.
    }

    public function detach(SplObserver $observer)
    {
        // TODO: Implement detach() method.
    }
    public function change(){
        $this->notify();
    }
    public function notify()
    {
        foreach ($this->all as $observer) {
            /** Observer $observer */
            $observer->update();
        }
        // TODO: Implement notify() method.
    }
}