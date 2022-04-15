<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Behavioral\ChainOfResponsibilities;

abstract class Handler
{
    private ?Handler $nextHandler;

    public function setNext(handler $handler)
    {
        $this->nextHandler = $handler;
    }

    /**
     * 这种方法通过使用模板方法模式，确保您每个子类都不会忘记调用给继任者
     * @param string $request
     * @return mixed|null
     */
    final public function handle($request)
    {
        $processed = $this->processing($request);
        if ($processed === null && $this->nextHandler !== null) {
            $processed = $this->nextHandler->handle($request);
        }
        return $processed;
    }

    abstract protected function processing($request);
}
