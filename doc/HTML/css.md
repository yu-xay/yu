+ [参考手册](https://www.runoob.com/cssref/css-reference.html#background)

+ [在线css](http://jsrun.net/new)
#####CSS轮廓 Outline
border: (border-width, border-style, border-color,inherit)
outline: (outline-color,outline-style,outline-width, inherit);
border-image
border-image-source: [none | image]
border-image-slice: 
border-image-width:
border-image-outset:
border-image-repeat:
box-shadow: inset



```html
<style>
	.border {
		height: 250px;
		width: 250px;
		border: 10px solid red;
		outline: blue solid 10px;
	}

	.border div {
		height: inherit;
		border: inherit;
	}
</style>
<div class="border">
	<div></div>
</div>
```





####css 背景属性
+ background-attachment: [scroll | fixed | inherit] 设置固定的背景图像
+ background-color: [COLOR | transparent | inherit] 设置元素背景颜色
+ background-image: [url('URL') | none | inherit]   将图像设置为背景
+ background-position: [top left | X% Y% | Xpos Ypos] 设置背景图像的开始位置
+ background-repeat: [repeat | repeat-x | repeat-y | no-repeat | inherit] 是否以及如何重复背景图像
+ background-clip: [border-box | padding-box | content-box] 背景图像的绘画区域
+ background-origin: [border-box | padding-box | content-box] 背景图像的定位区域
+ background-size: [length | % | cover | contain] 背景图片的尺寸
```html
<style>
	.bg {
		height: 400px;
		width: 400px;
		border: 20px dotted blue;
		background-clip: border-box;
		padding: 20px;
		background-color: inherit;
		background-image: url('http://dwz.date/bjw9');
		background-origin: padding-box;
		background-repeat: no-repeat;
		background-size: 200px 200px;
		background-position: 50% center;
		background-attachment: scroll;
		margin-top: 400px;
	}
</style>
<div style="background-color: #393432">
	<div class="bg">文本文本文本文本文本文本文本文本文本文本文本文本文本</div>
</div>
```






















box-shadow:h-shadow v-shadow blur spread color inset
text-shadow: h-shadow v-shadow blur color;
word-wrap: normal 默认 | break-word 长单词换行





border-image : 边框 兼容问题

[在线]: http://jsrun.net/new