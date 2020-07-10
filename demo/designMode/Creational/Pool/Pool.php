<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Pool;


/**
 * 是一种提前准备了一组已经初始化了的对象『池』而不是按需创建或者销毁的创建型设计模式。
 * 对象池的客户端会向对象池中请求一个对象，然后使用这个返回的对象执行相关操作。
 * 当客户端使用完毕，它将把这个特定类型的工厂对象返回给对象池，而不是销毁掉这个对象。
 * @package DesignMode\Creational\Pool
 */
class Pool
{
    private $occupiedWorkers = []; //工作区
    private $freeWorkers = []; //按需创建 不销毁对象

    public function get(): Worker
    {
        if (count($this->freeWorkers)) {
            $worker = array_pop($this->freeWorkers);
        } else {
            $worker = new Worker();
        }

        $this->occupiedWorkers[spl_object_hash($worker)] = $worker;
        return $worker;
    }

    public function dispose(Worker $worder)
    {
        $key = spl_object_hash($worder);
        if (isset($this->occupiedWorkers[$key])) {
            unset($this->occupiedWorkers[$key]);
            $this->freeWorkers[$key] = $worder;
        }
    }

    public function count(): int
    {
        return count($this->occupiedWorkers) + count($this->freeWorkers);
    }
}