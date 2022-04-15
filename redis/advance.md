1. 简单动态字符串 String
```c
    struct sdshdr {
        unsigned int len   已使用长度
        unsigned int alloc  总长度
        unsigned char flage 存储类型 sdshdr8 sdshdr16
        char buf[]  实提
    }
    与C自带的字符串区别
    长度复杂度由O(n)转O(1);
    可以二进制存储莫些特殊字符
    减少字符串搬运引起的扩容
```
2. List 双向链表
```节点
    typedef struct listNode {
        struct listNode * prev;
        struct listNode * next;
        void * value;
    } listNode;
    

    typedef struct list {
        listNode * head; 链表头
        listNode * tail; 链表尾
        unsigned long len; 链表长度
        void *(*dup) (void * ptr); 节点复制函数
    } listNode;
```
```
3. Set 集合 hashTable
```c
    typeof struct intset {
        unit32_t encoding; //编码方式 
        uint32_t length;   //集合长度
        int8_t contents[]; //元素数组
    }
```
4. ZSet 有序集合 HashTable+Sort
``跳表节点定义
    typeof sturct zskiplistNode {
        sds ele;
        double score; //权重值
        sturct zskiplistNode *backward;
        struct zskiplistLevel {
            struct zskiplistNode *forward;
            unsigned long span;
        } level[]//跳跃表数组
    }

    跳表定义
    typeof sturct zskiplist {
        struct zskiplistNode *header,*tail;
        unsigned long length;
        int level;
    } zskiplist;
```


###缓存淘汰
1. 先进先出FIFO         队列形式
2. 最近最少使用LRO       双向链表+哈希表  通过key找到hash表，将位置放到链表最前面
3. 最不经常使用       数据元素+被访问次数

###缓存雪崩
1. 预热
2. 分散时间
3. 永不过期

###缓存击穿
1. 用不过期
2. 异步进程 刷新缓存

### 缓存穿透
1. 缓存空对象
2. 布隆过滤器

##缓存一致
1.延迟双删
2.binlog日志来改下redis