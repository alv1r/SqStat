apt-get install apache2 php libapache2-mod-php php-fpm
wget https://github.com/alv1r/SqStat/archive/master.zip
unzip master.zip 
mv SqStat-master /var/www/sqstat
cp /var/www/sqstat/sqstat.conf /etc/apache2/sites-avaliable
a2ensite sqstat.conf 
service apache2 reload
