function Bird(ctx,img,frameX,frameY,x,y,speed){
		this.ctx = ctx;
		this.img = img;
		this.frameX = frameX;
		this.frameY = frameY;
		this.x = x;//小鸟的初始位置
		this.y = y;
		this.speedY = speed || 2;
		this.width = this.img.width/this.frameX;
		this.height = this.img.height/this.frameY;
		this.currentFrame = 0;
		this.direction = 0;
		this.speedUp = 0.2;
		this._bind();

	}
	Bird.prototype = {
		constructor: Bird,
		draw : function(){
			//旋转的基础值，当小鸟的速度为1时，旋转10度
			var baseRadian = Math.PI/180*10;
			var maxRadian = Math.PI/180*45;
			var speedRadian = this.speedY*baseRadian;
			speedRadian = speedRadian > maxRadian ? maxRadian : speedRadian;
			this.ctx.save();
			this.ctx.translate(this.x+this.width/2,this.y+this.height/2);
			this.ctx.rotate(speedRadian);
			this.ctx.drawImage(this.img,this.currentFrame*this.width,this.direction*this.height,this.width,this.height,
								-this.width/2,-this.height/2,this.width,this.height);
			this.ctx.restore();
		},
		updata : function(){
			this.currentFrame = ++this.currentFrame >= this.frameX ? 0 : this.currentFrame;
			this.y += this.speedY;
			this.speedY += this.speedUp;
		},
		//构造方法调用一次就好了
		_bind : function(){
			var that = this;
			this.ctx.canvas.addEventListener("click",function(){
				that.speedY = -4;
			})
		}
	}