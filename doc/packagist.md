##packagist
* [如何建立自己的composer包](https://www.jianshu.com/p/280acb6b0b22)
* [开发 Composer 包详细步骤](https://segmentfault.com/a/1190000013947602?utm_source=tag-newest "composer init 命令")

> packagist.org 找到submit;
 >> - (x)自动更新 => https://packagist.org/about#how-to-update-packages
 >> - (v)新版本自动更新

__github.com__
1. 打标签
2. draft a new release
3. this is a pre-release
4. composer update

> + Q: There is no license information available for the latest version (v0.1) of this package.
> + A: composer.json中添加："license": "MIT",

__TAG__
+ git tag [tag]
+ git push origin [tag]
+ git tag -d [tag]
+ git push origin :[tag]
