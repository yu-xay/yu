<?php
namespace designMode\Bahavioral\StaticFactory;
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

class Tel extends FormatterInterface
{
    public function dial()
    {
        return 'tel 拨号';
    }
}