<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Bridge;


class CakeFood implements Food
{
    public function eat()
    {
        return 'eat 饭';
    }
}
