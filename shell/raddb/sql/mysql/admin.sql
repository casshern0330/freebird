CREATE DATABASE radius;

CREATE USER 'radius'@'localhost' IDENTIFIED BY 'goodbaby';

GRANT ALL PRIVILEGES ON radius.* TO 'radius'@'localhost';

USE database radius;

source /etc/raddb/sql/mysql/wimax.sql;
source /etc/raddb/sql/mysql/nas.sql;
source /etc/raddb/sql/mysql/ippool.sql;
source /etc/raddb/sql/mysql/cui.sql;

INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Auth-Type',':=','Local');
INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Service-Type',':=','Framed-User');
INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Framed-IP-Address',':=','255.255.255.255');
INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Framed-IP-Netmask',':=','255.255.255.0');
INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Acct-Interim-Interval',':=','600');
INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Max-Monthly-Traffic',':=','102400');
INSERT INTO radgroupcheck (groupname,attribute,op,VALUE) VALUES ('user','Simultaneous-Use',':=','1');
INSERT INTO radcheck (username,attribute,op,value) values ('changwei.hu','Cleartext-Password',':=','goodbaby');
