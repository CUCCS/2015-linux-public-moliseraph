# Web服务器配置

## 实验名称
- Web服务器配置


## 实验环境

- Ubuntu 16.04 server
- nginx
- verynginx
- wordpress


---
### - 1.安装配置nginx和verynginx
- sudo apt install nginx
- 

### -2.配置8080端口nginx
- /etc/nginx/sites-enabled/目录，会找到一个default文件,将以前使用过的端口号改成8080端口。
- 


### - 3.安装verynginx
- sudo apt-get install libpcre3-dev
- sudo apt-get install libssl-dev
- sudo apt-get install build-essential
- sudo python install.py install
- 将/opt/verynginx/openresty/nginx/conf/nginx.conf文件第二行改为user www-data
- 启动服务 sudo /opt/verynginx/openresty/nginx/sbin/nginx
- 


### - 4.启动nginx
- 


### - 5.安装wordpress
- mysql -u root -p
- CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
- GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
- FLUSH PRIVILEGES;

- EXIT;
- sudo nano /etc/nginx/sites-available/default
- /etc/nginx/sites-available/default
server {
    . . .

    location = /favicon.ico { log_not_found off; access_log off; }
    location = /robots.txt { log_not_found off; access_log off; allow all; }
    location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
        expires max;
        log_not_found off;
    }
    . . .
}

- sudo nginx -t
- sudo systemctl reload nginx
- sudo apt-get update
- sudo apt-get install php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc
- sudo systemctl restart php7.0-fpm
- cd /tmp
- 
- $curl -O https://wordpress.org/latest.tar.gz
- 
- tar xzvf latest.tar.gz
- cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
- mkdir /tmp/wordpress/wp-content/upgrade
- sudo cp -a /tmp/wordpress/. /var/www/html
- sudo chown -R sammy:www-data /var/www/html
- sudo find /var/www/html -type d -exec chmod g+s {} \;
- sudo chmod g+w /var/www/html/wp-content
- sudo chmod -R g+w /var/www/html/wp-content/themes
- 
- $sudo chmod -R g+w /var/www/html/wp-content/plugins
- 
- curl -s https://api.wordpress.org/secret-key/1.1/salt/
- nano /var/www/html/wp-config.php
- sudo chown -R www-data /var/www/html
- sudo chown -R sammy /var/www/html
- 


## 实验要求

- verynginx设置反向代理
- matcher匹配
- filter 过滤
- response 响应
-proxy pass
- client 修改hosts文件
 

- 限制IP访问
- VeryNginx的Web管理页面仅允许白名单上的访客来源IP，其他来源的IP访问均向访客展示自定义的友好错误提示信息页面-3
 

- 在不升级Wordpress版本的情况下，通过定制VeryNginx的访问控制策略规则，热修复WordPress < 4.7.1 - Username Enumeration 
- 阅读漏洞利用代码得知，其原理为使用API查询得到用户的ID和name，所以限制访问该路径即可



- 通过配置VeryNginx的Filter规则实现对Damn Vulnerable Web Application (DVWA)的SQL注入实验在低安全等级条件下进行防护 
- and|or|select * 
- 通过定制VeryNginx的访问控制策略规则实现： 限制DVWA站点的单IP访问速率为每秒请求数 < 50
限制Wordpress站点的单IP访问速率为每秒请求数 < 20

测试代码：
- count=0
  while [[ $count -lt 55 ]]
  do
      echo $count
      curl -I dvwa.sec.cuc.edu.cn/verynginx/index.html
  count=$[ $count + 1 ]
  done

count=0
  while [[ $count -lt 22 ]]
  do
      echo $count
      curl -I wp.sec.cuc.edu.cn/verynginx/index.html
  count=$[ $count + 1 ]
  done




