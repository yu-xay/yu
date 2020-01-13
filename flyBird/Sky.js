function Sky(ctx,img,speed){
		this.ctx = ctx;
		this.img = img;
		this.speed = speed || 2;
		this.width = this.img.width;
		this.height = this.img.height;
		Sky.len++;
		this.x = this.width*(Sky.len-1);
		this.y = 0;
	}
	Sky.len = 0;
	Sky.prototype = {
		constructor : Sky,
		draw: function(){
			this.ctx.drawImage(this.img,this.x,this.y);
		},
		updata : function(){
			this.x -= this.speed;
			if(this.x < -this.width){
				this.x += this.width*Sky.len;
			}
		}
	}