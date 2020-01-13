function Land(ctx,img,speed){
		this.ctx = ctx;
		this.img = img;
		this.speed = speed || 2;
		Land.len++;
		this.width = this.img.width;
		this.height = this.img.height;
		this.x = this.width*(Land.len-1);
		this.y = this.ctx.canvas.height - this.height;
	}
	Land.len = 0;
	Land.prototype = {
		constructor : Land,
		draw : function(){
			this.ctx.drawImage(this.img,this.x,this.y);
		},
		updata:function(){
			this.x -= this.speed;
			if(this.x < -this.width){
				this.x += this.width*Land.len;
			}
		},
	}