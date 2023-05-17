CREATE USER IF NOT EXISTS 'joan'@'localhost' IDENTIFIED BY 'alumne';
GRANT ALL PRIVILEGES ON classicmodels.* TO 'joan'@'localhost';

CREATE USER IF NOT EXISTS 'joan08'@'10.0.64.28' IDENTIFIED BY 'alumne';
GRANT ALL PRIVILEGES ON classicmodels.* TO 'joan08'@'10.0.64.28';

CREATE USER IF NOT EXISTS 'dbeaver'@'%' IDENTIFIED BY 'alumne';
GRANT ALL PRIVILEGES ON *.* TO 'dbeaver'@'%';

CREATE USER IF NOT EXISTS 'joan08'@'localhost' IDENTIFIED BY 'alumne';
GRANT ALL PRIVILEGES ON classicmodels.* TO 'joan08'@'localhost';

CREATE USER IF NOT EXISTS  'joan'@'10.0.64.68' IDENTIFIED BY 'alumne';
GRANT ALL PRIVILEGES ON classicmodels.* TO 'joan'@'10.0.64.68';