#!/bin/bash

yum install -y ppp pptpd \
	freeradius freeradius-utils freeradius-client \
	freeradius-mysql mysql-server \
	php php-fpm

curl -OL http://jaist.dl.sourceforge.net/project/daloradius/daloradius/daloradius0.9-9/daloradius-0.9-9.tar.gz

tar -zxvf daloradius-0.9-9.tar.gz -C /usr/share && ln -s /usr/share/daloradius-0.9-9 /usr/share/daloradius
