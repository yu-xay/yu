<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div>123</div>
</body>
<script>
 //   var axios = require('./bower_components/axios/dist/axios.js');

    var b = require('./b');
    console.log(b.foo);
    setTimeout(() => {
        console.log(b.foo);
        console.log(require('./b').foo);
    }, 1000);

    axios.get('1.php')
        .then(function (response) {
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });
</script>
</html>