function loadImage(imageUrl,fn){
	var imgObj = {};//存储加载完毕后的图像
	var imgLen = 0;
	var loaded = 0;
	var tempImage = null;
	for(var key in imageUrl){
		imgLen++;
		tempImage = new Image();
		tempImage.onload = function(){
			loaded++;
			if(loaded >= imgLen){
				fn(imgObj);
			}
		}
		tempImage.src = imageUrl[key];
		imgObj[key] = tempImage;
	}
}


function extend(o1 , o2){
	for(var key in o2){
		if(o2.hasOwnProperty(key)){
			o1[key] = o2[key];
		}
	}
}

function angleToRadian(Angle){
	return Math.PI/180*Angle;
}