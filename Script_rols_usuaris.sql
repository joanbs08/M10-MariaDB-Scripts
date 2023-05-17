/*Create roles*/
DROP ROLE IF EXISTS 'Agents';
CREATE ROLE IF NOT EXISTS 'Agents';
DROP ROLE IF EXISTS 'HR';
CREATE ROLE IF NOT EXISTS 'HR';
DROP ROLE IF EXISTS 'Marketing';
CREATE ROLE IF NOT EXISTS 'Marketing';
DROP ROLE IF EXISTS 'Accounting';
CREATE ROLE IF NOT EXISTS 'Accounting';
DROP ROLE IF EXISTS 'Clients';
CREATE ROLE IF NOT EXISTS 'Clients';
DROP ROLE IF EXISTS 'Administrator';
CREATE ROLE IF NOT EXISTS 'Administrator';

/*Roles Privileges */

/*Agents department privileges*/
GRANT SELECT, INSERT ON classicmodels.customers TO Agents;
GRANT SELECT, INSERT, UPDATE, DELETE ON classicmodels.payments TO Agents;
GRANT SELECT, INSERT, UPDATE, DELETE ON classicmodels.orders TO Agents;

/*Human Resources department privileges*/
GRANT SELECT, INSERT, UPDATE, DELETE ON classicmodels.employees TO HR;
GRANT SELECT, INSERT, UPDATE, DELETE ON classicmodels.offices TO HR;

/*Marketing department privileges*/
GRANT SELECT, INSERT, UPDATE, DELETE ON classicmodels.products TO Marketing;
GRANT SELECT, INSERT, UPDATE, DELETE ON classicmodels.productlines TO Marketing;
GRANT SELECT ON classicmodels.orders TO Marketing;
GRANT SELECT ON classicmodels.orderdetails TO Marketing;

/*Accounting department privileges*/
GRANT SELECT ON classicmodels.products TO Accounting;
GRANT SELECT ON classicmodels.orders TO Accounting;
GRANT SELECT ON classicmodels.orderdetails TO Accounting;

/*Clients department privileges*/

USE classicmodels;

DROP VIEW IF EXISTS payments_customer;

CREATE VIEW payments_customer AS SELECT customers.customerNumber, orders.orderNumber, payments.paymentDate, payments.checkNumber, payments.amount 
FROM customers, orders, payments
WHERE customers.customerNumber = payments.customerNumber AND customers.customerNumber = orders.customerNumber AND customers.customerName = SUBSTRING_INDEX(SESSION_USER(), "@", 1);

GRANT SELECT ON classicmodels.payments_customer TO Clients;

/*create users*/
GRANT ALL PRIVILEGES ON classicmodels.* TO Administrator;

DROP USER IF EXISTS 'Diane'@'localhost';
CREATE USER IF NOT EXISTS 'Diane'@'localhost' IDENTIFIED BY 'admin';

DROP USER IF EXISTS 'Mary'@'localhost';
CREATE USER IF NOT EXISTS 'Mary'@'localhost' IDENTIFIED BY 'admin';

DROP USER IF EXISTS 'Jeff'@'localhost';
CREATE USER IF NOT EXISTS 'Jeff'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'William'@'localhost';
CREATE USER IF NOT EXISTS 'William'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'Gerard'@'localhost';
CREATE USER IF NOT EXISTS 'Gerard'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'Anthony'@'localhost';
CREATE USER IF NOT EXISTS 'Anthony'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'Julie'@'localhost';
CREATE USER IF NOT EXISTS'Julie'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'Steve'@'localhost';
CREATE USER IF NOT EXISTS 'Steve'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'Leslie'@'localhost';
CREATE USER IF NOT EXISTS 'Leslie'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'George'@'localhost';
CREATE USER IF NOT EXISTS'George'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'Atelier graphique'@'localhost';
CREATE USER IF NOT EXISTS 'Atelier graphique'@'localhost' IDENTIFIED BY 'alumne';

DROP USER IF EXISTS 'La Rochelle Gifts'@'localhost';
CREATE USER IF NOT EXISTS 'La Rochelle Gifts'@'localhost' IDENTIFIED BY 'alumne';

/*assign the role to the user*/
GRANT 'Administrator' TO 'Diane'@'localhost';
GRANT 'Administrator' TO 'Mary'@'localhost';
GRANT 'Marketing' TO 'Jeff'@'localhost';
GRANT 'Marketing' TO 'William'@'localhost';
GRANT 'Accounting' TO 'Gerard'@'localhost';
GRANT 'Accounting' TO 'Anthony'@'localhost';
GRANT 'Agents' TO 'Julie'@'localhost';
GRANT 'Agents' TO 'Steve'@'localhost';
GRANT 'Clients' TO 'Atelier graphique'@'localhost';
GRANT 'Clients' TO 'La Rochelle Gifts'@'localhost';
GRANT 'HR' TO 'Leslie'@'localhost';
GRANT 'HR' TO 'George'@'localhost';

/*activate the default role for the user*/
SET DEFAULT ROLE 'Administrator' FOR 'Diane'@'localhost';
SET DEFAULT ROLE 'Administrator' FOR 'Mary'@'localhost';

SET DEFAULT ROLE 'Marketing' FOR 'Jeff'@'localhost';
SET DEFAULT ROLE 'Marketing' FOR 'William'@'localhost';

SET DEFAULT ROLE 'Accounting' FOR 'Gerard'@'localhost';
SET DEFAULT ROLE 'Accounting' FOR 'Anthony'@'localhost';

SET DEFAULT ROLE 'Agents' FOR 'Julie'@'localhost';
SET DEFAULT ROLE 'Agents' FOR 'Steve'@'localhost';

SET DEFAULT ROLE 'Clients' FOR 'Atelier graphique'@'localhost';
SET DEFAULT ROLE 'Clients' FOR 'La Rochelle Gifts'@'localhost';

SET DEFAULT ROLE 'HR' FOR 'Leslie'@'localhost';
SET DEFAULT ROLE 'HR' FOR 'George'@'localhost';
