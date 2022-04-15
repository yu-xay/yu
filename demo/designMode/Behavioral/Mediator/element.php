<?php


namespace DesignMode\Behavioral\Mediator;


class element
{
    /**
     * @var shop
     */
    private shop $shop;
    /**
     * @var food
     */
    private food $food;
    private me $me;

    public function __construct(food $food, shop $shop,me $me){
        $this->food = $food;
        $this->shop = $shop;
        $this->me = $me;
        $this->food->setMediator($this);
        $this->shop->setMediator($this);
        $this->me->setMediator($this);
    }

    public function goshop(){
        return $this->shop->shop();
    }

    public function goorder(){
        return $this->user->order();
    }
    public function gofood(){
        return $this->food->food();
    }
}