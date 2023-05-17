DROP DATABASE IF EXISTS `CM_BAYARRI`;
CREATE DATABASE `CM_BAYARRI`; */
DROP USER IF EXISTS 'joanbayarri'@'localhost';
CREATE USER IF NOT EXISTS 'joanbayarri'@'localhost' IDENTIFIED BY 'alumne';
DROP USER IF EXISTS 'joanbs2004'@'10.0.64.28';
CREATE USER IF NOT EXISTS 'joanbs2004'@'10.0.64.28' IDENTIFIED BY 'admin123';
DROP USER IF EXISTS 'joan08'@'%';
CREATE USER IF NOT EXISTS 'joan08'@'%' IDENTIFIED BY 'joan1234';

/*Mostrar els tots els usuaris creats al mariadb
SELECT User FROM mysql.user;
SELECT User, Host FROM mysql.user;
*/
GRANT SELECT, DELETE, INSERT, UPDATE ON `CM_BAYARRI`.* TO 'joan08'@'%';
GRANT ALL ON `CM_BAYARRI`.* TO 'joanbayarri'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'joanbs2004'@'10.0.64.28';
DROP USER IF EXISTS 'joanbs08';
GRANT ALL ON *.* TO 'joanbs08' IDENTIFIED BY 'admin1234' WITH GRANT OPTION;
SELECT * FROM mysql.user;
REVOKE SELECT, DELETE, INSERT, UPDATE ON `CM_BAYARRI`.* FROM 'joan08';
DROP USER IF EXISTS 'joan2004';
RENAME USER 'joan08'@'%' TO 'joan2004'@'%';

/*Cambiar la contrasenya*/

/*Primera manera*/
SET PASSWORD FOR 'joan2004' = password('alumne');

/*Segona manera*/
ALTER USER 'joanbayarri'@'localhost' IDENTIFIED BY 'novacontraseña';

USE `CM_BAYARRI`;
DROP VIEW IF EXISTS customer_phone;
CREATE VIEW IF NOT EXISTS customer_phone AS SELECT customerName, phone FROM customers;
SELECT * FROM `CM_BAYARRI`.customer_phone;
GRANT SELECT ON `CM_BAYARRI`.customer_phone TO 'joan2004'; 
UPDATE customer_phone SET phone= 12345678 WHERE customerName= 'Signal Gift Stores';

/*Eliminar un usuari que tenim creat*/
DROP USER 'joanbs08';

/*Fer els canvis a la taula de privilegis*/
FLUSH PRIVILEGES;