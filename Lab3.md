# 实验三systemd实战

## 实验过程


### -命令篇
- 查看启动耗时、查看主机信息、查看并修改本地化设置 
- https://asciinema.org/a/437NeJpInWC6wXpMasycbSn9L

- 查看当前的登录用户、Unit系列操作 

- https://asciinema.org/a/6UgNgtRLKdEhbYp8T2ojqZpj7

- Unit管理及其之间的依赖关系 
- https://asciinema.org/a/3tGMvE5M4TZL0Vq4ZeNx5PLjs

- Unit配置文件以及Target 
- https://asciinema.org/a/U2fjlt2907JqCNvfxdnbVd3aU




- 日志管理 
- https://asciinema.org/a/cU01PUyS5sjasErr68PzW35LZ

-
### 实战篇

- 开机启动、启动服务、停止服务、配置文件查看及阅读、[service]区块的启动行为 
- https://asciinema.org/a/dRIH6yTMndHbRb0Bqs9y5sOY4




- [Install]区块、Target配置文件、修改配置文件后重启 
- https://asciinema.org/a/e26JiokIUO09KDFov1WE6yYFN


## 自查清单

---

- 如何添加一个用户并使其具备sudo执行程序的权限?
- sudo adduser username
sudo usermod -a -G sudo username

---

- 如何将一个用户添加到一个用户组？
- usermod -G staff newuser
- sudo usermod -a -G test username

---

- 如何查看当前系统的分区表和文件系统详细信息？
- sudo fdisk -l

---

- 如何实现开机自动挂载Virtualbox的共享目录分区?
- 安装增强功能
- 配置共享文件夹https://blog.csdn.net/skylake_/article/details/53132499
- /etc/fstab 文件中，添加 sharing /mnt/share vboxsf defaults 0 0


---

- 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量
-  1.扩容：sudo lvextend -L +10G /dev/vg/swap_1
-  2.减容：sudo lvreduce -L -10G /dev/vg/swap_1


---

- 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
- 修改networking.service文件，添加两行。
- ExecStarPre=/bin/bash /home/username/1.sh
ExecStopPost=/bin/bash /home/username/2.sh


---
- 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

修改该脚本的配置文件的service部分，将Restart字段设置参数为always。


---
## 参考链接
- http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html
- http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html





