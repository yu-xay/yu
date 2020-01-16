// index.js
var axios = require('axios');

axios.get('baidu.com')
    .then(function (response) {
        console.log(response);
    })
    .catch(function (error) {
        console.log(error);
    });

