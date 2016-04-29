FROM centos:6

MAINTAINER hu.cwei@qq.com

RUN yum -y install yum-plugin-fastestmirror epel-release \
	&& yum -y install ppp pptpd \
		freeradius freeradius-utils freeradius-client \
		freeradius-mysql mysql-server

RUN yum -y install python-setuptools &&\
	easy_install supervisor

COPY etc /etc
COPY raddb /etc/raddb
COPY radiusclient /etc/radiusclient

# init mysqld
RUN /etc/init.d/mysqld start &&\
	mysql -u root -e "source /etc/raddb/sql/mysql/admin.sql;" &&\
	mysql -u root -D radius -e "source /etc/raddb/sql/mysql/schema.sql;" &&\
	mysql -u root -D radius -e "insert into radcheck(username,attribute,op,value) values('changwei.hu','Cleartext-Password',':=','goodbaby');"

RUN mkdir -p /etc/supervisor/conf.d

COPY supervisor /etc/supervisor

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 1723

#RUN iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE &&\
#	service iptables save

ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisord.conf","-l","/var/log/supervisord.log","-j","/var/run/supervisord.pid"]
