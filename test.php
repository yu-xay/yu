<!doctype html>
<html lang="en">
<head>
    <base href="http://www.runoob.com/images/" target="_blank">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

</body>
<script>
    const someAsyncThing = function() {
        return new Promise(function(resolve, reject) {
            // 下面一行会报错，因为x没有声明
             //resolve(x + 2);
            throw new Error('temp');
             resolve(1);
            // resolve(3);
            //reject(123);
        });
    };

    let a = Promise.resolve()
        .catch(function(error) {
            return '111';;
            console.error(error);
        })
        .then(function(e) {
            return '222';
            console.log('carry on');
        }).finally((e) => {
            throw new Error('123123');
        return '333';
            console.log(123);
    });
    console.log(a);
</script>
</html>
