function GetQueryValue(queryName) {
    var query = decodeURI(window.location.search.substring(1));
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == queryName) {
            return pair[1];
        }
    }
    return null;
}

function clearCanvas() {
    var c = document.getElementById("cvs");
    var cxt = cvs.getContext("2d");
    cxt.clearRect(0, 0, c.width, c.height);
}

function init() {
    document.getElementById('center').style.display = "block";
    document.getElementById('start-img').style.display = "none";
    start();
}

function reload(e) {
    window.location.href = "index.html?id=111";
}

//绘制背景
function start() {
    loadImage({
        "bird": "./images/bird-new.png",
        "land": "./images/land-new.png",
        "pipeDown": "./images/pipeDown-new.png",
        "pipeUp": "./images/pipeUp-new.png",
        "sky": "./images/sky-new.png",
    }, function (imgobj) {
        cvs.width = imgobj.sky.width;
        cvs.height = imgobj.sky.height;

        // cvs.width = document.body.clientHeight;
        // cvs.height = document.body.clientWidth;
        //创建背景实例
        var sky1 = new Sky(ctx, imgobj.sky, 2);
        var sky2 = new Sky(ctx, imgobj.sky, 2);

        //创建地面实例
        var Land1 = new Land(ctx, imgobj.land, 2);
        var Land2 = new Land(ctx, imgobj.land, 2);
        var Land3 = new Land(ctx, imgobj.land, 2);
        var Land4 = new Land(ctx, imgobj.land, 2);

        //创建小鸟
        var bird = new Bird(ctx, imgobj.bird, 3, 1, 100, 50);
        var pipe1 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);
        var pipe2 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);
        var pipe3 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);
        var pipe4 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);
        var pipe5 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);
        var pipe6 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);
        var pipe7 = new Pipe(ctx, imgobj.pipeDown, imgobj.pipeUp, 150, imgobj.land.height, 0, 5);

        var a = 0;
        var timer = setInterval(function () {
            var birdCenterX = bird.x + bird.width / 2;
            var birdCenterY = bird.y + bird.height / 2;
            if (ctx.isPointInPath(birdCenterX, birdCenterY) || (birdCenterY < 0) || (birdCenterY > this.ctx.canvas.height - imgobj.land.height)) {
                clearInterval(timer);
                let count = parseInt(a / 33) - 1;
                ctx.fillStyle = "rgba(300,300,300,0.5)";
                ctx.fillRect(0, 0, this.ctx.canvas.width, this.ctx.canvas.height);

                document.getElementById('end').style.display = "block";
                document.getElementById('center').style.display = "none";
                document.getElementById('text').innerText = count > 0 ? count : 0;
                return;
            }
            a++;
            sky1.draw();
            sky1.updata();
            sky2.draw();
            sky2.updata();

            ctx.beginPath();
            pipe1.draw();
            pipe1.updata();
            pipe2.draw();
            pipe2.updata();
            pipe3.draw();
            pipe3.updata();
            pipe4.draw();
            pipe4.updata();
            pipe5.draw();
            pipe5.updata();
            pipe6.draw();
            pipe6.updata();
            pipe7.draw();
            pipe7.updata();

            Land1.draw();
            Land1.updata();
            Land2.draw();
            Land2.updata();
            Land3.draw();
            Land3.updata();
            Land4.draw();
            Land4.updata();
            //
            bird.draw();
            bird.updata();
        }, 50);
    })
}