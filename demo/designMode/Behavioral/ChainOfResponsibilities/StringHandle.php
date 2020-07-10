<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Behavioral\ChainOfResponsibilities;


class StringHandle extends Handler
{
    public function __construct(?handler $handler = null)
    {
        //parent::__construct();
        $this->setNext($handler);
    }

    public function processing($text)
    {
        return is_string($text) ? 'is string' : null;
    }
}