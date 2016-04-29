CREATE DATABASE radius;

CREATE USER 'radius'@'localhost' IDENTIFIED BY 'goodbaby';

GRANT ALL PRIVILEGES ON radius.* TO 'radius'@'localhost';
