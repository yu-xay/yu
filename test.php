<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<script>
    let obj = {
        [Symbol('my_key')]: 1,
        enum: 2,
        nonEnum: 3
    };

    let a = Reflect.ownKeys(obj);
    for(let b of a){
        console.log(obj[b]);
    }
</script>
<body>

</body>
</html>

