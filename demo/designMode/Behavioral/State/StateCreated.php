<?php declare(strict_types=1);

namespace DesignMode\Behavioral\State;

class StateCreated extends \DesignMode\Behavioral\State\OrderContext implements State
{
    public function proceedToNext(OrderContext $context)
    {
        $context->setState(new StateShipped());
    }

    public function toString(): string
    {
        return 'created';
    }
}
