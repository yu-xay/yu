<!doctype html>
<html lang="en">
<head>
    <base href="http://www.runoob.com/images/" target="_blank">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div style="background: #8888e5;width: 800px;height: 800px;margin-bottom:80px"></div>
<div style="background: #bde7a8;width: 80vw;height: 80vh;margin-bottom:80px"></div>
</body>
<script>
    const myMap = new Map()
        .set('yes', true)
        .set('no', false);
    console.log(myMap)
    for(let i of myMap){
        console.error(i);
    }

</script>
</html>
