FROM centos:6

MAINTAINE hu.cwei@qq.com

RUN yum -y install ppp pptpd iptables freeradius freeradius-utils freeradius-mysql mysql-server
