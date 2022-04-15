<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Proxy\dynamic;

class Real
{
    public function doSomething($data)
    {
        return $data . 'handle';
    }
}
