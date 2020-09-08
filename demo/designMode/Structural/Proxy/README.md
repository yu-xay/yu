### 代理模式
+ Explanation 
    + 代理类控制 script
+ usage   
+ example
    + 可使用代理 处理基类 加扩展
    + 虚拟代理 就是指需要的时候再初始化对象，不然只有代理没有对象
    + 
    ```
   强制代理
        echo "未加代理之前：\n";
        // 生产运动鞋
        $subject = new RealSubject();
        $subject->doSomething();
    
        echo "\n--------------------\n";
    
        echo "使用强制代理：\n";
        $proxy = $subject->getProxy();
        // 代工厂生产运动鞋
        $proxy->doSomething();
  ```