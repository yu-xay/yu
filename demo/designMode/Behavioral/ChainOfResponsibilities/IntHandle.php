<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Behavioral\ChainOfResponsibilities;


class IntHandle extends Handler
{
    public function __construct(?handler $handler = null)
    {
        //parent::__construct();
        $this->setNext($handler);
    }

    public function processing($text)
    {
        return is_int($text) ? 'is int' : null;
    }
}
