+ [参考手册](https://www.runoob.com/cssref/css-reference.html#background)
+ [在线css](http://jsrun.net/new)
#### 兼容
-webkit- -moz- -ms-

####常用CSS
+ overflow-x: [visible | hidden | screen | auto | no-display | no-content] 溢出元素显示内容
+ overflow-y: [不裁剪内容 | 裁剪隐藏滚动 | 裁剪不隐藏滚动 | 溢出才显示滚动 | 暂无浏览器支持 |暂无]
+ opacity: [{value} | inherit] 透明度

+ font-family: [{name} | inherit] 字体
+ font-style: [normal | italic 斜体 | oblique 斜体 | inherit] 字体style
+ font-weight: [normal | lighter | bold | bolder | {value} | inherit] 字体粗细
+ @font-face 指定字体 指定在哪里可以找到该字体的URL;

+ list-style: [ TYPE | POSITION | IMAGE | initial | inherit]: 该属性应用于li列表
+ list-style-image: [URL | none | inherit] 指定列表中列表 标记的图像
+ list-style-position: [inside | outside | inherit] 位置
+ list-style-type:  [none | ...] 样式

+ column-count: [number | auto] 元素分成列数
+ column-gap: [length | normal] 中间距离
+ column-rule: [width style color] 列之间样式
+ column-span: [1 | all] 跨越多少列
+ column-width: [auto | length] 列宽度
+ columns: [column-width: column-count]

+ clear: [left | right | both | none | inherit] 清除浮动
+ clip: [rect (top, right, bottom, left) | auto | inherit] 裁剪一张图像 搭配absolute
+ display: [...] 定义生成框类型 https://www.runoob.com/cssref/pr-class-display.html
+ visible: [visible | hidden | collapse | inherit] 是否可见

+ border-collapse: [collapse | separate | inherit] 规定是否合并表格边框
+ border-spacing: [length length | inherit] 规定相邻单元格边框之间的距离
+ caption-side: [top | bottom | inherit] 规定表格标题的位置
+ empty-cells: [hide | show | inherit] 规定是否显示表格中的空单元格上的边框和背景
+ table-layout: [automatic | fixed |inherit] 设置用于表格的布局算法

+ direction: [ltr | rtl | inherit] 文本书写方向
+ letter-spacing: [normal | length | inherit] 设置字符间距
+ text-decoration: [overline | line-through | underline] 文本装饰 删除 下滑线
+ text-indent: [length | % | inherit] 缩进
+ text-transform: [uppercase | capitalize | lowercase] 控制文本的大小写
+ text-align: [left | right |center | justify | inherit] 规定文本的水平对齐方式
+ vertical-align: [...] 	设置元素的垂直对齐方式
+ white-space: [normal | pre | nowrap | pre-wrap | pre-line] 设置怎样给一元素控件留白
+ white-spacing [normal | length | inherit] 设置单词间距
+ text-align-last: [...] 段落最后一行
+ text-overflow: [clip | ellipsis | string] 指定当文本溢出包含的元素，应该发生什么
+ text-shadow: [x y blur color] 文字阴影
+ word-break: [normal | break-all | keep-all] 断行规则
+ word-wrap: [normal | break-word] 设置浏览器是否对过长的单词进行换行


#### 盒子模型 => flex布局
#### 伪元素 content counter-increment con
#### 过渡 transition 《=》 2D/3D 转换属性




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