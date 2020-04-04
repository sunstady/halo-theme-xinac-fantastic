当前主题已支持 Halo v1.3.0版本，Halo 1.2.0及以下版本请使用 1.2.0 版本主题。

---

感谢分享如此优秀的主题！<br>
有点强迫症，在 https://github.com/Bursteretion/halo-theme-fantastic 主题的基础上做了一点点优化：

> 1、全部日期样式改为：yyyy-MM-dd EE <br>
> 2、首页和文章详情页增加了评论量、浏览量、标签，页脚显示靠左 <br>
> 3、主题设置增加 关注我和文章代码主题 <br>
> 4、友链按排序显示 <br>
> 5、摘要如果有代码时，样式会有问题，增加 word-break: break-word;<br>
> 6、页面优化更加细致，新增CDN优选功能，可自行配置CDN网址


## 网址：https://blog.xinac.cn/ 内容正在建设中。 

---

  有想用这个主题的请注意了，该主题的友链页面无法评论。因为Halo的作者没有开发这个地方的评论功能。
  
  解决方案：新建一篇文章（比如我用的Hello Halo这篇初始文章），然后放入回收站但不要删除，将此主题的评论页面代码 
  `<halo-comment id="59" type="sheet"></halo-comment>`部分，修改为 
  `<halo-comment id="1" type="post"></halo-comment>`，id就是文章的数据库id，不知道的去数据库查一下，然后就可以评论了。

---


在原来主题的基础上增加了日志页面, 增加了自定义插件功能

## 原预览地址

[访问](https://www.lwjppz.cn/)

## 使用前必看

[Fantastic 主题使用指南](https://www.imkun.dev/archives/Fantastic%20主题使用指南)

## 预览截图

![](https://www.lwjppz.cn/upload/2020/2/Q20200229170128-9f65480067fa4ef3998b203776e0bacd.png)



![](https://www.lwjppz.cn/upload/2020/2/20200229170655-7186c521fb194a599057842195ff0947.png)

![](https://www.lwjppz.cn/upload/2020/2/20200229192353-d9f1191bc6fc4d899d2645752177fe21.png)

## 使用方法

1. 克隆或者下载
2. 压缩为 zip 压缩包之后在后台的主题设置直接上传即可使用
3. 用Halo自还的程序拉取 `https://github.com/jinqilin721/halo-theme-fantastic.git`
