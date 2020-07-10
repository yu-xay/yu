<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Behavioral\ChainOfResponsibilities;

use Psr\Http\Message\RequestInterface;

class NumberHandle extends Handler
{
    public function processing($text)
    {
        return is_numeric($text) ? 'is numeric' : null;
    }
}
