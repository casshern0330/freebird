#!/bin/bash

yum install -y ppp pptpd \
	freeradius freeradius-utils freeradius-client \
	freeradius-mysql mysql-server \
	php php-fpm php-mysql

curl -OL http://jaist.dl.sourceforge.net/project/daloradius/daloradius/daloradius0.9-9/daloradius-0.9-9.tar.gz

tar -zxvf daloradius-0.9-9.tar.gz -C /usr/share && ln -s /usr/share/daloradius-0.9-9 /usr/share/daloradius

#pptpd 配置
cp etc/pptpd.conf /etc/pptpd.conf
cp etc/ppp/options.pptpd /etc/ppp/options.pptpd

#radius配置
cp raddb/radiusd.conf /etc/raddb/radiusd.conf
cp raddb/sql.conf /etc/raddb/sql.conf
cp raddb/dictionary /etc/raddb/dictionary
cp raddb/clients.conf /etc/raddb/clients.conf
cp raddb/sites-avaliable/default /etc/raddb/sites-avaliable/default
cp raddb/sites-avaliable/inner-tunnel /etc/raddb/sites-avaliable/inner-tunnel

#初始化数据库
cp raddb/sql/mysql/admin.sql /etc/raddb/sql/mysql/admin.sql
/etc/init.d/mysqld start &&
	mysql -u root -e "source /etc/raddb/sql/mysql/admin.sql"

#radiusclient配置
cp radiusclient/servers /etc/radiusclient/servers
cp radiusclient/dictionary /usr/share/radiusclient/dictionary
cp radiusclient/radiusclient.conf /etc/radiusclient/radiusclient.conf
cp radiusclient/dictionary.microsoft /usr/share/radiusclient/dictionary.microsoft

#daloradius配置
