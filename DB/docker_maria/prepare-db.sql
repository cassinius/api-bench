CREATE USER 'retailer'@'%' IDENTIFIED BY 'retailer';

CREATE DATABASE IF NOT EXISTS retailer_api;

GRANT ALL PRIVILEGES ON retailer_api.* TO 'retailer'@'%';
