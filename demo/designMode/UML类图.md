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
    企鹅 ————————＞ 气候
    在企鹅Penguin类中 引用到气候climate 对象
    class Penguin
    {
        private $climate;
    }
    ```
+ 聚合 一种弱的拥有关系 体现在A可以包含B，但B不是A对象的一部分
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
+ 依赖
    ```text
      动物----------＞水
      abstract class animal
      {
          public Metabolism (Water water)
          {
          }
      }
    ```