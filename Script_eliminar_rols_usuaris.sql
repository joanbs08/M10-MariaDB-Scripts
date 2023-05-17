DROP ROLE IF EXISTS 'Agents';
DROP ROLE IF EXISTS 'HR';
DROP ROLE IF EXISTS 'Marketing';
DROP ROLE IF EXISTS 'Accounting';
DROP ROLE IF EXISTS 'Clients';
DROP ROLE IF EXISTS 'Administrator';

DROP USER IF EXISTS 'Diane'@'localhost';
DROP USER IF EXISTS 'Mary'@'localhost';
DROP USER IF EXISTS 'Jeff'@'localhost';
DROP USER IF EXISTS 'William'@'localhost';
DROP USER IF EXISTS 'Gerard'@'localhost';
DROP USER IF EXISTS 'Anthony'@'localhost';
DROP USER IF EXISTS 'Julie'@'localhost';
DROP USER IF EXISTS 'Steve'@'localhost';
DROP USER IF EXISTS 'Leslie'@'localhost';
DROP USER IF EXISTS 'George'@'localhost';
DROP USER IF EXISTS 'Atelier graphique'@'localhost';
DROP USER IF EXISTS 'La Rochelle Gifts'@'localhost';

USE classicmodels;
DROP VIEW IF EXISTS payments_customer;
