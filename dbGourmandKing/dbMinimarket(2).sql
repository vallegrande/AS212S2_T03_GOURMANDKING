/* Poner en uso la Base de Datos */
USE dbMinimarket;

/* Listar tablas de la base de datos */
SHOW TABLES FROM dbMinimarket;

/* Agregar campo FECHA NACIMIENTO en la tabla VENDEDOR */
ALTER TABLE VENDEDOR
	ADD FECNACVEND DATE;

/* Verificar que se haya agregado el campo FECNACVEND */
DESCRIBE VENDEDOR;

/* La fecha de nacimiento del V00001 es el 20/06/1982 */
UPDATE VENDEDOR
	SET FECNACVEND = '1982/06/20'
    WHERE CODVEND = 'V00001';
    
/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Agregar fecha de nacimiento 17/11/1974 al VENDEDOR cuyo DNI es 22116633 */
UPDATE VENDEDOR
	SET FECNACVEND ='1974/11/17'
    WHERE DNIVEND='22116633';

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Agregar la fecha de nacimiento 22/10/1977 al VENDEDOR de apellidos ROJAS URRUTIA */
UPDATE VENDEDOR   
	SET FECNACVEND ='1977/10/22' 
    WHERE APEVEND ='ROJAS URRUTIA';

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Agregar campo HIJOS VENDEDOR en la tabla VENDEDOR */
ALTER TABLE VENDEDOR
	ADD HIJVEND INT DEFAULT (0);
    
/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;
/* El VENDEDOR Alberto Solano Pariona tiene 3 HIJOS */
UPDATE VENDEDOR   
	SET HIJVEND ='3' 
    WHERE NOMVEND ='Alberto' AND APEVEND ='Solano Pariona';

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Insertar un nuevo VENDEDOR */
INSERT INTO VENDEDOR
(CODVEND, NOMVEND, APEVEND, DNIVEND, CELVEND, DOMVEND, UBIVEND, FECNACVEND, HIJVEND)
VALUES
('V00004', 'Fabiano', 'Carrizales Solorzano', '74259188', '978216345', 'Av. Los Girasoles # 333', '140408', '1990/06/20', 4);

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Calcular el BONO para el vendedor que es de 50 soles por hijo */
ALTER TABLE VENDEDOR
	ADD BONOVEND DECIMAL(8,2) DEFAULT (HIJVEND * 50);
    
/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Agregar el SUELDO BASICO del VENDEDOR que es 1200 */
ALTER TABLE VENDEDOR
	ADD SUELVEND DECIMAL(8,2) DEFAULT (1200);

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Agregar columna con el SUELDO A PAGAR que es BONO + SUELDO BASICO */
ALTER TABLE VENDEDOR
	ADD SUELTOTVEND DECIMAL(8,2) DEFAULT (BONOVEND + SUELVEND);

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Listar APELLIDOS Y NOMBRES en una columna, dni, email, estado del CLIENTE */
SELECT 
	CONCAT(UPPER(APECLI), ', ', NOMCLI) AS 'Cliente',
    DNICLI AS DNI,
    EMACLI AS 'Correo electrónico',
    ESTCLI AS Estado
FROM 
	CLIENTE;

/* Listar datos del CLIENTE con el servidor de correo electrónico YAHOO y hayan nacido en el año 1978*/
SELECT 
	CONCAT(UPPER(APECLI), ', ', NOMCLI) AS 'Cliente',
    DNICLI AS DNI,
    EMACLI AS 'Correo electrónico',
    FECNACCLI AS 'Fecha Nacimiento',
    ESTCLI AS Estado
FROM 
	CLIENTE
WHERE 
	EMACLI LIKE '%@yahoo.com' AND YEAR(FECNACCLI) = 1978; -- Utilizando WILDCARDS

SELECT 
	CONCAT(UPPER(APECLI), ', ', NOMCLI) AS 'Cliente',
    DNICLI AS DNI,
    EMACLI AS 'Correo electrónico',
    YEAR(FECNACCLI) AS 'Año Nacimiento',
    ESTCLI AS Estado
FROM 
	CLIENTE
WHERE 
	EMACLI LIKE '%@yahoo.com' AND YEAR(FECNACCLI) = 1978; -- Utilizando WILDCARDS

/* Obtener el número de correos electrónicos por SERVIDOR */
SELECT 
    UPPER(SUBSTRING(EMACLI, LOCATE('@', EMACLI)+1)) AS 'SERVIDOR CORREO',
    COUNT(SUBSTRING(EMACLI, LOCATE('@', EMACLI)+1)) AS Total
FROM CLIENTE
GROUP BY SUBSTRING(EMACLI, LOCATE('@', EMACLI)+1);

/* Listar CLIENTES que hayan nacido en el PRIMER SEMESTRE del año 1980 */
SELECT 
	CONCAT(UPPER(APECLI), ', ', NOMCLI) AS CLIENTE,
    DATE_FORMAT(FECNACCLI, '%d/%m/%Y') AS 'Fecha Nacimiento'
FROM CLIENTE
WHERE FECNACCLI BETWEEN '1980/01/01' AND '1980/06/30';

/* Listar CLIENTE con su DEPARTAMENTO, PROVINCIA Y DISTRITO */
SELECT 
	CONCAT(UPPER(CLIENTE.APECLI), ', ', CLIENTE.NOMCLI) AS CLIENTE,
    UBIGEO.DEPUBI AS DEPARTAMENTO,
    UBIGEO.PROVUBI AS PROVINCIA,
    UBIGEO.DISTUBI AS DISTRITO
FROM CLIENTE INNER JOIN UBIGEO
	ON CLIENTE.UBICLI = UBIGEO.CODUBI;