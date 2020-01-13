function Pipe(ctx,pipeDown,pipeUp,space,landHeight,minHeight,speed){
		this.ctx = ctx;
		this.pipeDown = pipeDown;
		this.pipeUp = pipeUp;
		this.space = space;
		this.landHeight = landHeight;
		this.minHeight = minHeight || 50;
		this.speed = speed || 2;
		Pipe.len++;
		this.width = this.pipeDown.width;
		this.height = this.pipeDown.height;
		this.x = 300 + this.width*3*(Pipe.len-1);
		this.y = 0;
		this._init();
	}
	Pipe.len = 0;
	extend(Pipe.prototype,{
		_init:function(){
			var maxHeight = this.ctx.canvas.height - this.space - this.landHeight - this.minHeight;
			var randomHeight = Math.random()*maxHeight;
			randomHeight = randomHeight > 50 ? randomHeight : 50;
			this.downY = randomHeight - this.height;
			this.upY = randomHeight + this.space;
		},
		draw : function(){
			this.ctx.drawImage(this.pipeDown,this.x,this.downY);
			this.ctx.drawImage(this.pipeUp,this.x,this.upY);
			this._drawPath();
		},
		updata : function(){
			this.x -=this.speed;
			if(this.x < -this.width){
				this._init();
				this.x = this.x + (this.width*3*Pipe.len);
			}
		},
		_drawPath: function(){
			this.ctx.rect(this.x,this.downY,this.width,this.height);
			this.ctx.rect(this.x,this.upY,this.width,this.height);
			this.ctx.stroke();
		}
	})