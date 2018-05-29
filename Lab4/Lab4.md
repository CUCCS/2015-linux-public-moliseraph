# 实验四 shell脚本编程


vi test.sh
编辑内容
sh test.sh 
chmod +x ./test.sh增加可执行权限
 

## 任务一


---

-  任务一：用bash编写一个图片批处理脚本，实现以下功能【未实现】
  

---

- 支持命令行参数方式使用不同功能
 
-   getopt/getopts 命令 
   

#将 getopt 解析后的内容设置到位置参数


getopt是独立的可执行文件，而getopts是由Bash内置的。

 参数传递的典型用法:

     * ./test.sh -a -b -c  ： 短选项，各选项不需参数
     * ./test.sh -abc   ： 短选项，和上一种方法的效果一样，只是将所有的选项写在一起。
     * ./test.sh -a args -b -c ：短选项，其中-a需要参数，而-b -c不需参数。
     * ./test.sh --a-long=args --b-long ：长选项






---



- 支持对指定目录下所有支持格式的图片文件进行批处理

　for %f in (*.png) do convert “%f” -操作“%~nf_sample.png” 


---

- -支持以下常见图片批处理功能的单独使用或组合使用 

- 支持对jpeg格式图片进行图片质量压缩
convert -sample 25%x25% input.jpg output.jpg 


- 支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
- for %f in (*.png) do convert “%f” -sample 80×40 “%~nf_sample.png” 

---

- 支持对图片批量添加自定义文本水印
-  用ImgeMagick可以很容易的实现：
- 　　convert 1.png -fill white -pointsize 13 -draw “text 10,15 ‘lifesinger 2006＇” 2.png 
- 
- 　　可以用-font指定字体，这时需要安装Ghostscript支持: http://www.cs.wisc.edu/~ghost/ 
- 　　还可以用composite命令在所有图片上加上水印
　　

---

　　
- 支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）

  rename perl表达式 文件名
  #删除所有的.bak后缀：
  rename 's/\.bak$//' *.bak
 
  #把.jpe文件后缀修改为.jpg：
  rename 's/\.jpe$/\.jpg/' *.jpe
 
  #把文件名改为小写：
  rename 'y/A-Z/a-z/' *

  rename [options] expression replacement file...


---





- 支持将png/svg图片统一转换为jpg格式图片
 
  for %f in (*.png) do convert “%f” “%~nf.jpg” 

- 


---

## 任务二

- 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
- 2014世界杯运动员数据，统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
- 统计不同场上位置的球员数量、百分比
- 名字最长的球员是谁？名字最短的球员是谁？
- 年龄最大的球员是谁？年龄最小的球员是谁？




---

## 任务三
- Web服务器访问日志 ◦
- usage
- 统计访问来源主机TOP 100和分别对应出现的总次数
- 

- 统计访问来源主机TOP 100 IP和分别对应出现的总次数
-
- 统计最频繁被访问的URL TOP 100
- 统计不同响应状态码的出现次数和对应百分比
- 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
- 给定URL输出TOP 100访问来源主机





---




## 参考链接
https://github.com/CUCCS/linux/blob/master/2017-1/ZXM/EX04/ex02.sh
https://github.com/CUCCS/2015-linux-public-tyushua1/blob/%E5%AE%9E%E9%AA%8C%E5%9B%9B/%E5%AE%9E%E9%AA%8C%E5%9B%9B/task1.sh
http://zlb1986.iteye.com/blog/778054
http://linux-wiki.cn/wiki/%E6%89%B9%E9%87%8F%E9%87%8D%E5%91%BD%E5%90%8D%E6%96%87%E4%BB%B6


