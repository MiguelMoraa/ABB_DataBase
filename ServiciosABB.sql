/* mysql -u root -p -h localhost
   Miguel93*/
DROP DATABASE IF EXISTS ABB; /*Elimina la base de datos si existe*/
CREATE DATABASE IF NOT EXISTS ABB; /*Crea la base de datos si no existe en el servidor*/
USE ABB; /*Usa la base de datos creada*/
SELECT DATABASE(); /*Muestra la base de Datos que se está utliizando*/

/*Siempre se debe crear la taba principara y despues la de pertenencia*/
DROP TABLE IF EXISTS Order_Handlers_and_Salers;
CREATE TABLE IF NOT EXISTS Order_Handlers_and_Salers (
  Order_Handler_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, /*UNSIGNED evita numeros negativos*/
                                /*PRIMARY KEY (Order_Handler_ID) Declara llave primaria*/
  Name ENUM ('Julio','Ale','Ivonne','Fernando','Adrian','Luis'), /*Lista de valores que puede tomar*/
  Last_Name ENUM ('Mendoza','Estrada','Muñoz','Becerril','Carrales','Solano'),
  Roll ENUM ('Order_Handler','Saler'),
  Alias VARCHAR (50) UNIQUE, /*Declarar valores únicos en el campo*/
        /*CONSTRAINT UNIQUE(Alias) Declarar valores unicos en el campo*/
  Location ENUM ('México','San Luis Potosí','Monterrey'),
  First_Date DATE NOT NULL,
  Created_Date DATETIME DEFAULT CURRENT_TIMESTAMP
               /*Crear fecha específica DATETIME '2020-06-05'*/
);

DROP TABLE IF EXISTS ABB_Service; /*Elimina la tabla si existe*/
CREATE TABLE IF NOT EXISTS ABB_Service( /*Crea la tabla si no Existe*/
  Service_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, /*Define la llave primaria*/
  Order_Handler_ID INT UNSIGNED NOT NULL, /*Declara la llave foranea en la tabla de pertenecia*/
  Customer VARCHAR (50) NOT NULL,
  City CHAR (50) NOT NULL,
  Service_Type ENUM ('Programación','Mantenimiento','Garantía','Curso','Troubleshooting'),
  Begin_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  Service_Order VARCHAR (10) NOT NULL,
  Comments VARCHAR (50),
  Created_Date DATETIME DEFAULT CURRENT_TIMESTAMP, /*Fecha actual Años, Mes, Dia, Hora, Minutos, Segundos*/
  FOREIGN KEY (Order_Handler_ID) REFERENCES Order_Handlers_and_Salers (Order_Handler_ID) ON DELETE CASCADE/*Indica que ese argumento es la llave foranea y permite eliminacion en cascada*/
);

SHOW TABLES; /*Muestra Tablas de esa base de Datos*/
/*SHOW COLUMNS FROM ABB_Service; Muestra la definición de las Columnas de la Tabla ABB_Service*/
DESC ABB_Service; /*Muestra la definición de las Columnas de la Tabla ABB_Service*/
CREATE TABLE ABB_Project LIKE ABB_Service; /*Crea una tabla identica a ABB_Service con el nombre de  ABB_Project */
DROP TABLE ABB_Project;

INSERT INTO Order_Handlers_and_Salers(Name,Last_Name,Roll,Alias,Location,First_Date)
VALUES ('Ale','Estrada','Order_Handler','Alesita','San Luis Potosí', '2017-01-01'),
       ('Julio','Mendoza','Order_Handler','Cap','México','1906-07-06'),
       ('Ivonne','Muñoz','Order_Handler','FL','San Luis Potosí', '2016-08-16'),
       ('Fernando','Becerril','Saler','Gordini','México','2015-06-07'),
       ('Adrian','Carrales','Saler','Pepa','Monterrey','2006-05-08'),
       ('Luis','Solano','Saler','Pantera','San Luis Potosí', '2002-01-01');

INSERT INTO ABB_Service(Order_Handler_ID, Customer, City, Service_Type, Begin_Date, End_Date, Service_Order, Comments)
VALUES (1,'HPP Systems','Pachuca','Programación','2020-01-02','2020-01-09','4560244','Cambio de Robot WaterJet'), /*Tuplas*/
       (3,'ABB','San Luis Potosí','Curso','2020-01-12','2020-01-19','4548202','C. Programación Avanzada'),
       (3,'ABB','San Luis Potosí','Curso','2020-01-20','2020-01-26','4580281','C. Mantenimiento Eléctrico'),
       (1,'Brose','Querétaro','Troubleshooting','2020-01-28','2020-01-29','4575643','Inspección de falla'),
       (3,'ABB','San Luis Potosí','Curso','2020-02-10','2020-01-15','4548202','C. Programación Básica'),
       (3,'ABB','San Luis Potosí','Curso','2020-02-16','2020-01-22','4548202','C. Mantenimiento Eléctrico'),
       (3,'Thysenkrupp', 'Puebla','Garantía','2020-02-23','2020-01-25','M141018','Granatía IRB 1200'),
       (2,'Pisa','Guadalajara','Mantenimiento','2020-02-23','2020-01-25','4579621','Mttos IRB 6700 y 4600'),
       (3,'ABB','San Luis Potosí','Curso','2020-03-01','2020-03-07','4584384', 'C. RobotStudio'),
       (2,'YanFeng','Querétaro','Mantenimiento','2020-03-08','2020-03-09','4583681','Mtto IRB 2600'),
       (1,'Austromex','CDMX','Troubleshooting','2020-03-12','2020-03-12','4587794','Problema en Memory Flash'),
       (2,'YanFeng','Querétaro','Mantenimiento','2020-03-14','2020-03-13','4583681','Mtto IRB 2600'),
       (1,'Tecnológico de Monterrey','Atizapán','Troubleshooting','2020-03-24','2020-03-24','4588752','Fallo en Memoria'),
       (1,'American Axle','Silao','Troubleshooting','2020-03-27','2020-03-28','4589944','Diagnóstico de Falla EPS'),
       (2,'GLM Components','Puebla','Mantenimiento','2020-04-02','2020-04-03','4589464','Mttos a IRB 2400 y 2600'),
       (2,'YanFeng','Querétaro','Mantenimiento','2020-04-22','2020-04-24','4583681','Mtto IRB 2600'),
       (2,'Lear','CDMX','Mantenimiento','2020-05-14','2020-05-15','4583139','Mtto IRB 2600'),
       (1,'Gerreshmaier','Querétaro','Programación','2020-05-18','2020-05-22','4595673','Modificación de Programa'),
       (1,'American Axle','Silao','Programación','2020-05-25','2020-05-27','4589944','Configuración de EPS'),
       (2,'Hyundai','Monterrey','Mantenimiento','2020-05-31','2020-06-2','4586439','Mtto de IRB 6700'),
       (1,'Ford','Irapuato','Programación','2020-06-28','2020-06-29','4598987','Validación de SafeMove 2'),
       (1,'Nissan','Aguascalientes','Programación','2020-05-30','2020-06-21','4586295','Proyecto de prensas');

ALTER TABLE ABB_Service ADD Stock INT  UNSIGNED NOT NULL DEFAULT 10;
ALTER TABLE ABB_Service ADD Saler CHAR(50); /*Modifica la tabla añadiendo una columna*/
ALTER TABLE ABB_Service DROP COLUMN Saler; /*Modifica la tabla  Elimina una columna*/
/*ALTER TABLE ABB_Service RENAME Servicios_ABB; /*Modifica el nombre de la tabla*/
ALTER TABLE ABB_Service MODIFY Customer VARCHAR(70); /*Modifica el tipo de dato de la tabla*/
/*ALTER TABLE usuarios ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id); Genarar una llave prrimaria
ALTER TABLE usuarios ADD FOREIGN KEY(grupo_id) REFERENCES grupos(grupo_id); Añadir llave foranea
ALTER TABLE usuarios DROP FOREIGN KEY grupo_id; ELimnar llave foranea*/
SELECT * FROM ABB_Service\G; /*Visualizar tabla en formato vertical*/
SELECT Service_ID,Customer FROM ABB_Service; /*Obtener valores específicos de la Tabla ABB_Service*/
SELECT * FROM ABB_Service WHERE City = 'Querétaro'; /*Busqueda puntual en la Tabla ABB_Service donde CLiente sea Querétaro*/
SELECT Service_ID FROM ABB_Service WHERE Begin_Date > "2020-02-01" AND Begin_Date < "2020-06-06"; /*Condiciona la consulta*/
ALTER TABLE ABB_Service ADD Saler VARCHAR (50);
SELECT Customer FROM ABB_Service WHERE Saler IS NULL; /*Condicional manipulando NULL*/
SELECT End_Date,Comments FROM ABB_Service WHERE End_Date BETWEEN "2020-01-01" AND "2020-04-01"; /*Obtener datos por rango*/
SELECT Begin_Date FROM ABB_Service WHERE City IN ('Puebla',
                                                  'Monterrey',
                                                  'CDMX',
                                                  'Guadalajara'); /*Obtener datos dentro de una lista*/
SELECT DISTINCT City FROM ABB_Service; /*Visualizar datos únicos repetidos solo aprecen una vez*/
SELECT Order_Handler_ID AS Admin, City AS Ciudad FROM ABB_Service AS ABB_Servicio; /*Asigna un alias a la columna y tabla*/
UPDATE ABB_Service SET Comments = "Al right" WHERE City = 'Pachuca'; /*Actualiza los datos de la tabla puntualmente*/
UPDATE ABB_Service SET Comments = "Cambio de Robot WaterJet" WHERE City = 'Pachuca';
UPDATE ABB_Service SET Comments = "Prueba de Cambio" WHERE Service_ID = 20; /*Se recomianda modificar con el ID*/
/*DELETE FROM ABB_Service WHERE Service_ID = 22; /*Elimina puntalmente un registro*/
/*ELiminacion en cascada, no se puede eliminar un registro se se use como llave foranea en otra Tabla
Primero se debe eliminar el registro de pertenencia y después el registro  de la llave primaria*/
/*DELETE FROM Order_Handlers_and_Salers WHERE Order_Handler_ID =1; /*Borra en Cascada a Order Handler 1 (Ale)*/
SELECT * FROM ABB_Service;
/*TRUNCATE TABLE ABB_Service; /*Elimina registros de la tabla (Autoincrement comienza en 1)*/
SELECT CONCAT(Name," ",Last_Name) AS Full_Name FROM Order_Handlers_and_Salers; /*Cancatenar argumentos " " son esppacios*/
SELECT LENGTH ("Hola Mundo") AS Mensaje; /*Muestra la cantidad de caracteres*/
SELECT * FROM Order_Handlers_and_Salers WHERE LENGTH (Name) >=4; /*Muestra nombres con caracteres >= 4*/
SELECT UPPER(Name), LOWER(NAME) AS Mayusculas_Minusculas FROM Order_Handlers_and_Salers; /*Muestra nombres en Mayus y Minus*/
SELECT TRIM("     Enunciado con espacios al inicio y fin     "); /*Elimina los espacios*/
SELECT LEFT("Cadena de caracteres",5)AS IZQ, RIGHT("Cadena de caracteres",5) AS DERECHO; /*Obtiene caracteres de un strin derecha o izquierdda*/
SELECT * FROM ABB_Service WHERE LEFT (Service_Type,4) = "Prog"; /*Muestra registros que empiecen con Prog*/
SELECT * FROM ABB_Service WHERE RIGHT (City,1) = "o"; /*Muestra Registros que terminen con o*/
SELECT RAND(); /*Muestra numero aleatorio entre 0 y 1*/
SELECT ROUND(RAND()*100); /*Muestra numero redonadeado entre 1-100*/
SELECT TRUNCATE(1.123456789,3); /*Trunca los decimales de un numero flotante*/
SELECT POW(2,8); /*Resultado de elevar 2 a la 8 (Potencias)*/
SELECT NOW(); /*Muestra Fecha exact*/
SET @now = NOW(); /*Crea varaible con fecha actual*/
SELECT SECOND(@now) AS Segundos, /*Extrae valores de la fecha actual*/
       MINUTE(@now) AS Minutos,
       HOUR(@now) AS Horas,
       DAY(@now) AS Días,
       MONTH(@now) AS Meses,
       YEAR(@now) AS AÑO,
       DAYOFWEEK(@now),/*Día de la semana número*/
       DAYOFMONTH(@now), /*Día del mes*/
       DAYOFYEAR(@now); /*Día del Año*/
SELECT DATE (@now); /*Convierte la fecha exacta en solo fecha*/
SELECT * FROM ABB_Service WHERE DATE (Created_Date) = CURDATE(); /*Muestra Registros que se crearon hoy*/
SELECT @now + INTERVAL 30 DAY; /*Agrega 30 días a la fecha actual*/
SELECT IF(9<10,"EL número es Mayor","El número es menor"); /*Condición, si se cumple, Si no se cumple*/
SELECT IF (Service_Order= "M141018", "El Servicio no tiene SO", "El servicio si tiene SO") FROM ABB_Service;
SELECT IFNULL (Saler,"No tiene Vendedor Asignado") FROM ABB_Service;


DELIMITER ! /*Cambio Signo para indicar fin de sentencias*/
CREATE FUNCTION Add_Days(Fecha DATE, Dias INT) /*Crea una función*/
RETURNS DATE /*Regresa dato tipo DATE*/
BEGIN /*Inicio de logica de función*/
  RETURN Fecha + INTERVAL Dias DAY; /*Agrga dias n a la Fecha*/
END ! /*Fin deFunción*/
DELIMITER ; /*Cambio Signo para indicar fin de sentencias*/
SELECT Add_Days(@now,60); /*Se usa la función agregandoo 60 días*/
SELECT name FROM mysql.porc WHERE db = database() AND type = 'FUNCTION'; /*Visualiza las funcinoes creadas*/
DROP FUNTION Add_Days; /*ELimina función*/

DELIMITER !
CREATE FUNCTION Get_SO()
RETURNS INT
BEGIN
  SET @SO = (SELECT ROUND((RAND()*100)*4)); /*Obtiene valor random de 4 cifras*/
  RETURN @SO;
END !
DELIMITER ;
SELECT Get_SO();
UPDATE ABB_Service SET Service_Order = Get_SO(); /*Asigna SO random*/

SELECT City FROM ABB_Service WHERE City LIKE "San%"; /*Muestra registros que contengan "San" al inicio*/
SELECT City FROM ABB_Service WHERE City LIKE "%Potosí"; /*Muestra registros que contengan "San" al final*/
SELECT City FROM ABB_Service WHERE City LIKE "%aro%"; /*Muestra registros que contengan "aro" donde sea*/
SELECT City FROM ABB_Service WHERE City LIKE '____e____'; /*Muestra registros que contengan 9 caracteres y en el tercero sea letra "e" guines bajos indican cant de caractres*/
SELECT City FROM ABB_Service WHERE City LIKE '_a%'; /*Muestra registros que contengan en su segundo caracter la letra a*/
SELECT City FROM ABB_Service WHERE City LIKE '_a____a%'; /*Muestra registros que contengan en su segundo caracter la letra a y septimo a*/
SELECT City FROM ABB_Service WHERE City REGEXP '^[PM]'; /*Muestra registro que comincen con las letras dentro de los corchetes*/
SELECT City FROM ABB_Service ORDER BY City ASC; /*Muestra registros ordenados de forma ascendente alfabeticamente (ASC) puede o no llevarlo*/
SELECT City FROM ABB_Service ORDER BY City DESC; /*Muestra registros ordenados de forma descendente alfabeticamente*/
SELECT City FROM ABB_Service LIMIT 10; /*Limita mostrar los 10 primeros registros de la tabla*/
SELECT City FROM ABB_Service WHERE Order_Handler_ID =2 LIMIT 4; /*Limita a 4 registros del order handler es 2 (Julio)*/
SELECT Service_ID,City FROM ABB_Service LIMIT 4,10; /*Muestra regiistros indicando desde donde empezar y cuantos en este caso empieza del 5 al 14*/
SELECT COUNT(*) AS Total_Service  FROM ABB_Service; /*Cuenta cuántos registros contiene la tabla*/
SELECT COUNT(*) AS Total_NOTNULL FROM ABB_Service WHERE Service_Order IS NOT NULL; /*Cuenta registros donde SO no contenga null*/
SELECT COUNT(Service_Order) AS Total_SO FROM ABB_Service; /*Es lo mismo de arriba*/
SELECT SUM(Service_Order) AS Suma_SO FROM ABB_Service; /*Suma el valor de todos los registros*/
SELECT MAX(Service_Order) AS Max_SO FROM ABB_Service; /*Muestra el mayor valor de todos los registros*/
SELECT MIN(Service_Order) AS Min_SO FROM ABB_Service;/*Muestra el menor valor de todos los registros*/
SELECT AVG(Service_Order) AS Prom_SO FROM ABB_Service;/*Muestra el promedio de todos los registros*/
SELECT Order_Handler_ID, SUM(Order_Handler_ID) FROM ABB_Service GROUP BY Order_Handler_ID; /*Muestra la suma delos servicios de cada Order Handler sumados*/
SELECT Order_Handler_ID, SUM(Order_Handler_ID) FROM ABB_Service GROUP BY Order_Handler_ID ORDER BY Order_Handler_ID ASC LIMIT 1; /*Muestra el primer registro con numero sumado*/
SELECT Order_Handler_ID, SUM(Order_Handler_ID) AS Total FROM ABB_Service GROUP BY Order_Handler_ID HAVING SUM(Order_Handler_ID) > 13; /*Muestra las Sumas de las SO simpere y cuando sean mayores a 4578965*/

DROP TABLE IF EXISTS Field_Service_Engineers;
CREATE TABLE IF NOT EXISTS Field_Service_Engineers(
  FSE_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  Name CHAR(20) NOT NULL,
  Last_Name CHAR(50) NOT NULL,
  Alias CHAR(50),
  Location ENUM ("CDMX", "SLP", "MTY"),
  Created_Date DATETIME DEFAULT CURRENT_TIMESTAMP
);

 INSERT INTO Field_Service_Engineers(Name, Last_Name, Alias,Location)
 VALUES("Miguel", "Mora", "Mike", "CDMX"),
       ("Humberto","Santamaría","Tommy","CDMX"),
       ("Carlos","Guerrero","Monkey","CDMX"),
       ("Luis","Castrejón","Memin","CDMX"),
       ("Antonio","Cortez","Monaguillo","CDMX"),
       ("Iván","Lecona","Iguano","CDMX"),
       ("Omar", "Regalado","Topo","CDMX"),
       ("Alberto","Olmedo","Zombie","CDMX"),
       ("José","Rangel","Gordo","SLP"),
       ("Guillermo","Sánchez","Memo","SLP"),
       ("Andrés","García","Cosaki","SLP"),
       ("Alfredo","Reyes","Motomoto","SLP"),
       ("Juan","Navarrete","Vasir","SLP"),
       ("David","Amaro","Deivid","Mty"),
       ("Juan","Cavazos","Babazos","Mty");

SELECT * FROM Field_Service_Engineers;

SELECT CONCAT(Name, " ", Last_Name) AS Service_Personel  FROM Order_Handlers_and_Salers
UNION
SELECT CONCAT(Name," ", Last_Name) AS Service_Personel FROM Field_Service_Engineers; /*Unir 2 resultados en uno solo*/

SET @Average =(SELECT AVG(Order_Handler_ID) FROM ABB_Service);
SELECT Order_Handler_ID 
FROM ABB_Service 
  GROUP BY Order_Handler_ID 
  HAVING SUM(Order_Handler_ID)> @Average; /*Muestra registros de consulta con variable*/

SELECT Order_Handler_ID 
FROM ABB_Service 
  GROUP BY Order_Handler_ID 
  HAVING SUM(Order_Handler_ID)> (SELECT AVG(Order_Handler_ID) FROM ABB_Service); /*Muestra registros de consulta con subconsulta*/

SELECT CONCAT(Name," ",Last_Name) AS Nombres
FROM Order_Handlers_and_Salers
  WHERE Order_Handler_ID IN(
    SELECT Order_Handler_ID 
    FROM ABB_Service 
      GROUP BY Order_Handler_ID 
      HAVING SUM(Order_Handler_ID)> (SELECT AVG(Order_Handler_ID) FROM ABB_Service));/*Muestra los registos de condiciones con subconsultas*/

SELECT IF(
  EXISTS (SELECT (Service_ID) FROM ABB_Service WHERE City = "Monterrey"),
  "Adquirida",
  "No Adquirida"
  ) AS Adquisición; /*Muestra Adquirido a No Adequirida si la condición de la consulta se cumple*/

/*Ejercicios*/

/*1*/

SELECT City, Alias FROM ABB_Service WHERE Alias  IS NOT NULL;
/*Fin de Ejercicios*/

SELECT A_S.City, CONCAT(O_H_S.Name," ", O_H_S.Last_Name) AS Nombre, A_S.Begin_Date /*Siempre que se trabaje con JOIN es correcto definir la pertenencia*/
FROM ABB_Service AS A_S                            /*Llave primaria               Llave foranea*/                                                                                                                  /* Ejemplo: Order_Handlers_and_Salers.*/
  INNER JOIN Order_Handlers_and_Salers AS O_H_S ON A_S.Order_Handler_ID = O_H_S.Order_Handler_ID; /*Muestra registros de la union de las tablas*/

SELECT A_S.City, CONCAT(O_H_S.Name," ", O_H_S.Last_Name) AS Nombre, A_S.Begin_Date /*Siempre que se trabaje con JOIN es correcto definir la pertenencia*/
FROM ABB_Service AS A_S                                                                                                                           /* Ejemplo: Order_Handlers_and_Salers.*/
  INNER JOIN Order_Handlers_and_Salers AS O_H_S USING (Order_Handler_ID); /*Utilizando USING se aume de ambas tablas cuentan con el mismo nombre del campo*/

SELECT A_S.City, CONCAT(O_H_S.Name," ",O_H_S.Last_Name) AS Nombre, A_S.Begin_Date
From ABB_Service AS A_S
  INNER JOIN Order_Handlers_and_Salers AS O_H_S ON A_S.Order_Handler_ID = O_H_S.Order_Handler_ID 
  AND O_H_S.Alias IS NOT NULL; /*Muestra registros que cumplan la condición de not nul e INNER JOIN*/

 /*LEFT JOIN Y LEFT OUTER JOIN son lo mismo*/

DROP TABLE IF EXISTS Service_FSE;
CREATE TABLE IF NOT EXISTS Service_FSE(
  Service_ID INT UNSIGNED NOT NULL,
  FSE_ID INT UNSIGNED NOT NULL,
  FOREIGN KEY (Service_ID) REFERENCES ABB_Service(Service_ID) ON DELETE CASCADE, 
  FOREIGN KEY (FSE_ID) REFERENCES  Field_Service_Engineers(FSE_ID) ON DELETE CASCADE,
  Begin_Date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Service_FSE (Service_ID, FSE_ID)
VALUES (8,5),(6,11),(13,9),
       (3,15),(12,8),(22,12),
       (7,1),(2,2),(3,10);

SELECT
  CONCAT(Name," ",Last_Name),
  S_FSE.Service_ID
FROM Field_Service_Engineers AS FSE /*Tabla derecha siempre va en FROM*/
  LEFT JOIN Service_FSE AS S_FSE ON FSE.FSE_ID = S_FSE.FSE_ID
  WHERE S_FSE.Service_ID IS NOT NULL; /*Permite obtener regitros de amabas tablas como registro de la tabla derecha*/

 /*RIGHT JOIN Y RIGHT OUTER JOIN son lo mismo*/

SELECT CONCAT(Name, " ", Last_Name),S_FSE.Service_ID
FROM Service_FSE AS S_FSE /*Tabla derecha siempre va en FROM*/
  RIGHT JOIN Field_Service_Engineers AS FSE ON FSE.FSE_ID = S_FSE.FSE_ID
  WHERE S_FSE.Service_ID IS NOT NULL; /*Permite obtener regitros de amabas tablas como registro de la tabla izquierda*/

SELECT DISTINCT CONCAT(FSE.Name," ", FSE.Last_Name) AS Nombre_Completo
FROM Field_Service_Engineers AS FSE
  INNER JOIN Service_FSE AS S_FSE ON FSE.FSE_ID = S_FSE.FSE_ID
                                     AND DATE (S_FSE.Begin_Date) = CURDATE()
  INNER JOIN ABB_Service AS ABB_S ON S_FSE.Service_ID = ABB_S.Service_ID
  INNER JOIN Order_Handlers_and_Salers AS O_H_S ON ABB_S.Order_Handler_ID = O_H_S.Order_Handler_ID
                                                   AND O_H_S.Alias IS NOT NULL;

SELECT Field_Service_Engineers.Name, ABB_Service.City FROM Field_Service_Engineers CROSS JOIN ABB_Service ORDER BY Name DESC; /*A cada FSE se le asigna una servicio ya creado (Ciudad)*/

INSERT INTO Service_FSE (Service_ID, FSE_ID) SELECT Service_ID,FSE_ID FROM Field_Service_Engineers CROSS JOIN ABB_Service;

SELECT Field_Service_Engineers.Name, Field_Service_Engineers.Alias, Field_Service_Engineers.Location
FROM Field_Service_Engineers
INNER JOIN Service_FSE ON Field_Service_Engineers.FSE_ID = Service_FSE.FSE_ID;

DROP VIEW IF EXISTS Ciudades_FSE_VW; /*Elimina la vista si existe (No se requiere si tenemos REPLACE abajo)*/
CREATE OR REPLACE VIEW Ciudades_FSE_VW AS /*Crea a o remplaza la vista y se puede tratar como una tabla nomral*/
SELECT FSE.FSE_ID,
       FSE.Name,
       FSE.Last_Name,
       FSE.Alias,
       FSE.Location,
       COUNT(FSE.FSE_ID) AS Ciudades
FROM Field_Service_Engineers AS FSE
  INNER JOIN Service_FSE ON FSE.FSE_ID = Service_FSE.FSE_ID
            AND Service_FSE.Begin_Date >= CURDATE() - INTERVAL 5 DAY
  GROUP BY FSE.FSE_ID;

SHOW TABLES;

DROP PROCEDURE IF EXISTS Proc; /*Elimina procedimiento... No es posible editar un Prodecure se debe eliminar y volver a crear*/
DELIMITER //
CREATE PROCEDURE Proc(FSE_ID INT, Service_ID INT, OUT Cantidad INT)
BEGIN
  SET Cantidad = (SELECT Stock FROM ABB_Service WHERE ABB_Service.Service_ID = Service_ID);
  IF Cantidad > 0 THEN
    INSERT INTO Service_FSE(Service_ID,FSE_ID)
    VALUES(Service_ID,FSE_ID);
    UPDATE ABB_Service SET Stock = Stock -1  WHERE ABB_Service.Service_ID = Service_ID;
    SET Cantidad = Cantidad -1;
  /*ELSEIF (Condición)*/
  ELSE
      SELECT "No es posible realizar el Servicio" AS Mensaje;
    END IF;
END//
DELIMITER ;

/*Obtener valores de los procedures*/
SET @Cantidad = -1;
CALL Proc (5, 10, @Cantidad);
SELECT @Cantidad; /*cuentra el Valor de la varaible*/

SELECT name FROM mysql.proc WHERE db = database() AND TYPE = 'PROCEDURE'; /*Muestra todos los procediemintos de la base de datos*/

DROP PROCEDURE IF EXISTS Tipo;
DELIMITER //
CREATE PROCEDURE Tipo(FSE_ID INT)
BEGIN
  SET @Cantidad = (SELECT COUNT(*) FROM Service_FSE
                  WHERE Service_FSE.FSE_ID = FSE_ID);
  CASE
    WHEN @Cantidad > 20 THEN
      SELECT "Excelente" AS Mensaje;
    WHEN @Cantidad > 10 AND @Cantidad < 20 THEN
      SELECT "Bueno" AS Mensaje;
    WHEN @Cantidad > 5 AND @Cantidad < 10 THEN
      SELECT "Regular" AS Mensaje;
    ELSE
      SELECT "Malo" AS Mensaje;
  END CASE;
END//
DELIMITER ;

CALL Tipo (2);

DROP PROCEDURE IF EXISTS Service_Random;
DELIMITER //
CREATE PROCEDURE Service_Random()
BEGIN
  SET @Iteracion = 0;
  WHILE @Iteracion < 5 DO
    SELECT Service_ID, City FROM ABB_Service ORDER BY RAND() LIMIT 1;
    SET @Iteracion = @Iteracion + 1;
  END WHILE;
END//
DELIMITER ;

CALL Service_Random;

DROP PROCEDURE IF EXISTS Service_Random_2;
DELIMITER //
CREATE PROCEDURE Service_Random_2()
BEGIN
  SET @Iteracion = 0;
  REPEAT
    SELECT Service_ID, City FROM ABB_Service ORDER BY RAND() LIMIT 1;
    SET @Iteracion = @Iteracion + 1;
  UNTIL @iteracion >= 5
  END REPEAT;
END//
DELIMITER ;

CALL Service_Random_2;

/*Bloqueos*/

START TRANSACTION; /*Inicia la trasacción*/
  SET @Service_ID = 22, @FSE_ID = 2;

  UPDATE ABB_Service SET Stock = Stock - 1 WHERE Service_ID = @Service_ID;
  SELECT Stock FROM  ABB_Service WHERE Service_ID = @Service_ID;

  INSERT INTO Service_FSE(Service_ID, FSE_ID)
  VALUES(@Service_ID,@FSE_ID);
  SELECT * FROM Service_FSE;
COMMIT; /*Termina Trasacción Que el valor de la trasaccoin persista*/
ROLLBACK; /*Hace un B-Start (Regresa hasta la ultima vez de no marco error)*/

DROP PROCEDURE IF EXISTS Proc_2;
DELIMITER //
CREATE PROCEDURE Proc_2(FSE_ID INT, Service_ID INT)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION /*Cuando ocurra un erro*/
  BEGIN
    ROLLBACK;
  END;
  START TRANSACTION;
    INSERT INTO Service_FSE(Service_ID,FSE_ID)
    VALUES(Service_ID,FSE_ID);
    UPDATE ABB_Service SET Stock = Stock - 1  WHERE ABB_Service.Service_ID = Service_ID;
  COMMIT;
END//
DELIMITER ;

SELECT * FROM Service_FSE; /*Agrga un registro (341)*/
SELECT Stock FROM ABB_Service WHERE Service_ID = 14; /*Reduce el Stick de 10 a 9*/
CALL Proc_2 (10,14); 
SELECT Stock FROM ABB_Service WHERE Service_ID = 14;
CALL Proc_2 (100,14); /*Dato Erroneo*/
SELECT Stock FROM ABB_Service WHERE Service_ID = 14; /*Aún posee 9 en stock*/
SELECT * FROM Service_FSE; /*Aún tiene 342*/

SHOW ENGINES;

SET storage_engine=INNODB; /*Modificar elm otor de almacenamiento*/
SHOW TABLE STATUS WHERE `Name` = 'ABB_Service' \G; /*Cononcer elm otor de almacenamoento*/

CREATE TABLE tabla_innodb (id int, value int) ENGINE=INNODB; /*Crear tabla con motor INNODB*/
CREATE TABLE tabla_myisam (id int, value int) ENGINE=MYISAM; /*Crear tabla con motor MYISAM*/
CREATE TABLE tabla_default (id int, value int);

/*Eventos*/

CREATE TABLE test(
 evento VARCHAR(50),
 fecha DATETIME 
);

SET GLOBAL event_scheduler = ON; /*Habilitar servidor para ejecutar evrntos*/

CREATE EVENT insertion_event /*Crea evento para insertar registro en tabla casda min*/
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE /*Nombre de evento no mas de 64 char (insertion_event)*/
DO INSERT INTO test VALUES ('Evento 1', NOW());

ON SCHEDULE AT '2018-12-31 12:00:00' /*Ejecuta el evento en una fecha específica*/

DELIMITER //

CREATE EVENT insertion_event_2
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN  /*Si se requiere ejecutar mas de una sentencia en el evento se utiliza BEGIN y END*/
 INSERT INTO test VALUES ('Evento 1', NOW());
 INSERT INTO test VALUES ('Evento 2', NOW());
 INSERT INTO test VALUES ('Evento 3', NOW());
END //

DELIMITER ;

SHOW events\G; /*Muestra eventos creados*/
DROP EVENT insertion_event_2; /*Elimina evento*/

/*Una vez el evento haya expirado, este, será eliminado de forma automática. Si nosotros no queremos que esto ocurra debemos de apoyarnos de ON COMPLETION*/

ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE

CREATE EVENT nombre_evento /*Eventos en Store Procedures*/
ON SCHEDULE AT 'fecha de ejeución' 
DO
CALL store_procedure();

/*Evento que se ejecuta un minuto despues de las 18:30*/
CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
DO INSERT INTO test VALUES ('Evento 1', NOW());

/*Evento que se ejecuta en un rango de fechas*/
CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
ENDS '2018-07-07 19:00:00'
DO INSERT INTO test VALUES ('Evento 1', NOW());

ALTER EVENT nombre_evento /*Desactivar Evento */
DISABLE; 

ALTER EVENT nombre_evento /*Activar Evento*/
ENABLE;

SET GLOBAL event_scheduler = OFF; /*Detener eventos Desshabilitar el servidor*/

CREATE
    [DEFINER = { user | CURRENT_USER }]
    EVENT
    [IF NOT EXISTS]
    event_name
    ON SCHEDULE schedule
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT 'string']
    DO event_body;

schedule:
    AT timestamp [+ INTERVAL interval]
  | EVERY interval
    [STARTS timestamp [+ INTERVAL interval]]
    [ENDS timestamp [+ INTERVAL interval]]

interval:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}

/*Cursores*/

/*Solo se utilizan en Stroe Procedures*/

DELIMITER //

DROP PROCEDURE IF EXISTS facilito_procedure//
CREATE PROCEDURE facilito_procedure()
BEGIN
  DECLARE var_id INTEGER;
  DECLARE var_paginas INTEGER; /*Declaración de Variables*/
  DECLARE var_titulo VARCHAR(255);
  DECLARE var_final INTEGER DEFAULT 0;
  DECLARE cursor1 CURSOR FOR SELECT libro_id, titulo, paginas FROM libros; /*cra cursor a partir de consulta*/
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1; /*Una vez todos los regirstros de la consulta haya interado el valor var_final cambia a 1*/
  OPEN cursor1; /*Comenzar iteración de elementos (Abre cursor)*/
  bucle: LOOP /*Se controla iteración por LOOP a partir de la variable var_fnial*/
    FETCH cursor1 INTO var_id, var_titulo, var_paginas; /*Obtiene la fila actual de la consulta y avanza al sig elemento (Orden es importante en variables)*/
    IF var_final = 1 THEN
      LEAVE bucle;
    END IF;
    UPDATE libros SET paginas = var_paginas + 10 WHERE libro_id = var_id;
    SELECT
      var_titulo AS  'titulo',
      var_paginas AS 'Anterior',
      paginas AS 'Incremento'
    FROM libros WHERE libro_id = var_id;
  END LOOP bucle;
  CLOSE cursor1; /*Carrar cusor*/
END//

DELIMITER ;

call facilito_procedure();

/*Respaldo de una sola base de datos*/

mysqldump base_de_datos > ruta/archivo_respaldo.sql
mysqldump --databases db1 db2 db3 > ruta/archivo_respaldo.sql /*Realoizar respaldos de multiples dases de datos*/
mysqldump base_de_datos tabla1 > ruta/archivo_respaldo.sql /*Respaldo de una sola tabla*/
mysqldump base_de_datos tabla1 tabla3 > ruta/archivo_respaldo.sql /*Respaldo de multiples tablas*/

/*Triggers*/

ALTER TABLE Order_Handlers_and_Salers ADD COLUMN Cantidad_Service INT DEFAULT 0;
SELECT * FROM Order_Handlers_and_Salers\G;

DELIMITER //
CREATE TRIGGER AFTER_INSERT_Update_Cantidad
AFTER INSERT ON ABB_Service
FOR EACH ROW
BEGIN
  UPDATE Order_Handlers_and_Salers SET Cantidad_Service = Cantidad_Service + 1 WHERE Order_Handler_ID = NEW.Order_Handler_ID; /*NEW refiere al registo actual que se ha insertado*/
END;
//
DELIMITER ;

INSERT INTO ABB_Service (Order_Handler_ID, Service_Order, Begin_Date, City, End_Date)
VALUES (2,"4356789","2020-08-03", "Irapuato","2020-08-03");
SELECT * FROM Order_Handlers_and_Salers WHERE Cantidad_Service = 1 \G; /*Cantidad aumento a un por el trigger*/

DELIMITER //
CREATE TRIGGER AFTER_DELETE_Update_Cantidad
AFTER DELETE ON ABB_Service
FOR EACH ROW
BEGIN
  UPDATE Order_Handlers_and_Salers SET Cantidad_Service = Cantidad_Service - 1 WHERE Order_Handler_ID = OLD.Order_Handler_ID; /*OLD refiere al registo eliminado*/
END;
//
DELIMITER ;

SELECT Service_ID, CIty FROM ABB_Service;

DELETE FROM ABB_Service WHERE Service_ID = 23;
SELECT * FROM Order_Handlers_and_Salers\G; /*Se elimina el registro por trigger*/

DELIMITER //
CREATE TRIGGER AFTER_UPDATE_Update_Cantidad
AFTER UPDATE ON ABB_Service
FOR EACH ROW
BEGIN
  IF (NEW.Order_Handler_ID != OLD.Order_Handler_ID) THEN 
    UPDATE Order_Handlers_and_Salers SET Cantidad_Service = Cantidad_Service + 1 WHERE Order_Handler_ID = NEW.Order_Handler_ID; /*NEW refiere al registo actual que se ha insertado*/
    UPDATE Order_Handlers_and_Salers SET Cantidad_Service = Cantidad_Service - 1 WHERE Order_Handler_ID = OLD.Order_Handler_ID; /*OLD refiere al registo eliminado*/
  END IF;
END;
//
DELIMITER ;

UPDATE ABB_Service SET Order_Handler_ID = 1 WHERE Service_ID = 22;
SELECT Order_Handler_ID, Name, Cantidad_Service FROM Order_Handlers_and_Salers;

SHOW TRIGGERS\G;

DROP TRIGGER IF EXISTS ABB.AFTER_UPDATE_Update_Cantidad; /*Para eliminar un trugger de pone la base de datos (ABB.)*/