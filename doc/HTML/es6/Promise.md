##Promise
- pending(进行中) fulfilled(已成功) rejected(已失败)
- [承诺] 只有异步操作的结果可以决定当前是哪一种状态
```javascript 1.8
    const promise = new Promise(function(resolve,reject){
        if(true){
            resolve(value);// pending => fulfilled
        } else {
            reject(error); // pending => rejected
        }
    });
    promise.then(function(value){
        console.log('success');
    },function(error){
        console.log('error');
    });
```