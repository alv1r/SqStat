# SqStat
SqStat - Скрипт отображения статистики прокси-сервера Squid в реальном времени. Автор Alex Samorukov.
http://samm.kiev.ua/sqstat/

Скрипт был написан 10 лет назад, с тех пор поменялся формат данных, котороые отдает Squid.
Решение было найдено у Руслана Кидуна.
http://kidun.ru/index.php/component/content/article?id=165

В представленной версии исправлена ошибка,описаная выше, добавлена совместимость с PHP7, русифицирован скрипт и представлен скрипт для вэб-сервера Apache.
##Установка:
```
apt-get install apache2 php libapache2-mod-php php-fpm
wget https://github.com/alv1r/SqStat/archive/master.zip
unzip master.zip 
mv SqStat-master /var/www/sqstat
cp /var/www/sqstat/sqstat.conf /etc/apache2/sites-avaliable/sqstat.conf
a2ensite sqstat.conf 
service apache2 reload

```
##Настройка:
Файл config.inc.php является файлом настроек. Под спойлером его содержимое.
<details> 
<summary>спойлер</summary>
   
```
<?php
/* global settings */

$use_js=true; // use javascript for the HTML toolkits

// Maximum URL length to display in URI table column
DEFINE("SQSTAT_SHOWLEN",60);


/* proxy settings */

/* Squid proxy server ip address or host name */
$squidhost[0]="192.168.10.1";
/* Squid proxy server port */
$squidport[0]=3128;
/* cachemgr_passwd in squid.conf. Leave blank to disable authorisation */
$cachemgr_passwd[0]="secret";
/* Resolve user IP addresses or print them as numbers only [true|false] */
$resolveip[0]=false; 
/* uncomment next line if you want to use hosts-like file. 
   See hosts.txt.dist. */
// $hosts_file[0]="hosts.txt"
/* Group users by hostname - "host" or by User - "username". Username work only 
   with squid 2.6+ */ 
$group_by[0]="username";

/* you can specify more than one proxy in the configuration file, e.g.: */
// $squidhost[1]="192.168.0.2";
// $squidport[1]=3129;
// $cachemgr_passwd[1]="secret";
// $resolveip[1]=true; 
// $hosts_file[1]="otherhosts.txt"
?>
```
</details>
###Нужно изменить следующие параметры:

$squidhost[0]="**192.168.10.1**"; - адрес сервера

$squidport[0]=**3128**; - порт

$cachemgr_passwd[0]="**secret**"; - пароль для доступа к кешу

$group_by[0]="**username**"; - имя пользователя

###В файл squid.conf необходимо внести следующие изменение:


acl webserver src **192.168.10.1/32**

cachemgr_passwd **secret** all

