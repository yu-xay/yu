类图基本属性 
类
+ 类名称
    - 斜体表示absolute类
    - <<interface>>表示接口
+ 特性(字段或属性)
    - +表示public
    - -表示private
    - #表示protected
    - _表示static
    - 斜体表示absolute
+ 操作(方法或行为)


类与类 类与接口关系

+ 泛化
    + 继承 鸟    ————————▷动物
+ 实现
    + 接口 大雁  --------▷飞翔 
    
+ 关联 一个类知道另外一个类
    ```text
    对于两个相互独立的对象，当一个对象的实例与另外一个对象的一些特定实例存在固定的对应关系时；
    关联关系时使用实例变量来实现

    企鹅 ————————＞ 气候
    在企鹅Penguin类中 引用到气候climate 对象
    class Penguin
    {
        private $climate;
    }
    ```
  + 依赖
      ```text
        对于两个相互独立的对象，当一个对象负责构造另一个对象的实例，或者依赖另外一个对象的服务时；
        表现在局部变量 方法的参数 以及对静态方法的调用
        动物----------＞水
        abstract class animal
        {
            public Metabolism (Water water)
            {
            }
        }
      ```

+ 聚合 一种弱的拥有关系 两个对象具有各自的生命周期
    ```text
     大雁＜————————◇雁群
    在雁群WideGooseAggregate类中，有大雁数组对象
      class WideGooseAggregate
      {
          private array arrayWideGoose;
      }
    ```
+ 组合(组合) 一种强的拥有关系，部分和整体的生命周期一样
    ```text
          n       n
     翅膀＜————————◆鸟提
     在鸟Bird类中，初始化时，实例化翅膀Wing，他们之间同时生成
      class Bird
      {
          private Wing wing;
          public Bird()
          {
              wing = new Wing()
          }
      }
    ```

