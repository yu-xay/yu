##Promise
- pending(进行中) fulfilled(已成功) rejected(已失败)
- [承诺] 只有异步操作的结果可以决定当前是哪一种状态
- Promise 会吃掉错误
```javascript
    const promise = new Promise(function(resolve,reject){
        if(true){
            setTimeout(resolve, 600, 'success'); // pending => fulfilled
        } else {
           //不会终结程序运行
           return reject(error); // pending => rejected
        }
    });
    promise.then(function(value){
        console.log('success');
    },function(error){
        return 'error';
    }).then(next => {
        //上一个回调的返回值
        console.log('next');
    }).catch(fail => console.log('fail'))
    .finally(next => console.log('finally'));


    Promise.all(url.map(item => {
        return new Promise((resolve_c, reject_c) => {
            
        });
    })).then(result => console.log(123));
```
- Promise.race()    //一个改变 总状态跟着改变
