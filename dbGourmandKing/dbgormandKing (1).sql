create database dbGourmandKing;
use dbGourmandKing;
create table UBIGEO
(
	CODUBG int,
    CODCLI INT,
    CODEMP INT,
    DEPUBG VARCHAR(50),
    PROUBG VARCHAR(50),
    DISUBG VARCHAR(50),
    CONSTRAINT CODUBG_PK PRIMARY KEY (CODUBG)
);

create table MENU
(
	CODMEN int,
    PREMEN INT,
    ENTMEN VARCHAR(50),
    SEGUMEN VARCHAR(50),
    BEBMEN VARCHAR(50),
    CONSTRAINT CODMEN_PK PRIMARY KEY (CODMEN)
);

CREATE TABLE EMPLEADO
(
	CODEMP INT,
    NOMEMP VARCHAR(50),
    APEEMP VARCHAR(50),
    DNIEMP VARCHAR(8),
    CELEMP VARCHAR(9),
    CONSTRAINT CODEMP_PK PRIMARY KEY (CODEMP)
);

CREATE TABLE CLIENTE
(
	CODCLI INT,
    NOMCLI VARCHAR(50),
    APECLI VARCHAR(50),
    DNICLI CHAR(8),
    EMACLI VARCHAR(300),
    CELCLI CHAR(9),
    CODUBG INT,
     CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

CREATE TABLE VENTA
(
	CODVENT INT,
    FECVENT DATE,
    CODCLI INT,
    CODEMP INT,
    METSER INT,
     CONSTRAINT CODVENT_PK PRIMARY KEY (CODVENT)
);

CREATE TABLE VENTA_DETALLE
(
	IDVENDET int,
    CODVENT INT,
    CODMEN INT,
    CANTVENT INT,
    CONSTRAINT IDVENDET_PK PRIMARY KEY (IDVENDET)
);

/* Insertar registros CATEGORIA */
INSERT INTO menu
(CODMEN,PREMEN,ENTMEN,SEGUMEN,BEBMEN)
VALUES
('1','10.00','sopa','Arroz con pollo','chicha morada');
INSERT INTO menu
(CODMEN,PREMEN,ENTMEN,SEGUMEN,BEBMEN)
VALUES
('2','15.00','no','Parrillada','gaseosa');

INSERT INTO menu
(CODMEN,PREMEN,ENTMEN,SEGUMEN,BEBMEN)
VALUES
('3','12.00','papa a la huancaina','Tallarines verdes','chicha morada'),
('4','13.50','Tamales','Lomo saltado','Chicha de jora'),
('5','18.00','Humitas','Parrillada','gaseosa'),
('6','12.00','Papa rellena','Arroz con pollo','gaseosa'),
('7','14.00','no','Sopa seca','Chicha morada'),
('8','10.00','no','Chicharron de pescado','Cebada'),
('9','11.00','Papa rellena','Seco de res','Carambola'),
('10','16.00','Tamales','Pachamanca','Limonada');

insert into empleado
(CODEMP,NOMEMP,APEEMP,DNIEMP,CELEMP)
VALUES
('1025','Juan Arturo','Vasquez Vasquez','54628750','976235698'),
('1026','Pedro','Bravo Tesen','25642540','975456985'),
('1027','Steven Manuel','Martinez Cubas','25415780','9741235489'),
('1028','Blanca Belen','Loayza Velasquez','21564870','976123456'),
('1029','Araveli','Vargas Olano','23651484','976458756'),
('1030','Anthony','Catón Jibaja','25469872','976548752'),
('1031','Daniel','Ventura Yangua','23156487','9761245784'),
('1037','Mario Eduardo','Chamorro Veliz','12458747','974231564'),
('1033','Vanessa Lupita','Tsucamoto Vasquez','23659874','975213658'),
('1032','Nathaly Mariel','Cabrera Soberon','12032055','998215489');

insert into cliente
(CODCLI,NOMCLI,APECLI,DNICLI,EMACLI,CELCLI,CODUBG)
values
('0001','Juan Pablo','Martinez Velasquez','70665599','juanpablo34@gmail.com','998452621','140401'),
('0002','Daniel','Estrada Ventura','70702255','daniel.ventura@gmail.com','976854759','140402'),
('0003','Esteban','Bravo Araujo','70669955','esteban08500@hotmail.es','985556214','140403'),
('0004','Anthony Ruben','Monteza Catón','70669421','montezacatonruben@gmail.com','998461874','140404'),
('0005','Marcos','Tiesto Tesen','70998556','tesen2865@hotmail.com','976854985','140405'),
('0006','Christian Manuel','Salgado Yangua','70665599','manuelsalgado@gmail.com','998445125','140406'),
('0007','Jose Noe','Huaman Rodriguez','70556622','huamanrodrigueznoe@gmail.com','998445621','140407'),
('0008','Silvia Noemi','Yacolta Maximiliano','70659841','yacoltanoemi2771@hotmail.com','563214874','140408'),
('0009','Jedy Perci','Vicente Valerio','70695233','valerioperci@gmail.com','976854825','140409'),
('0010','Irina Daniela','Aquino Serpa','70521489','aquinodaniela@hotmail.com','975842157','140410');

insert into ubigeo
(CODUBG,CODCLI,CODEMP,DEPUBG,PROUBG,DISUBG)
VALUES
('140401','0001','1025','Lima','Cañete','San Vicente de Cañete'),
('140402','0002','1026','Lima','Cañete','Calango'),
('140403','0003','1027','Lima','Cañete','Cerro Azul'),
('140404','0004','1028','Lima','Cañete','Coayllo'),
('140405','0005','1029','Lima','Cañete','Chilca'),
('140406','0006','1030','Lima','Cañete','Imperial'),
('140407','0007','1031','Lima','Cañete','Lunahuana'),
('140408','0008','1037','Lima','Cañete','Mala'),
('140409','0009','1033','Lima','Cañete','Nuevo Imperial'),
('140410','0010','1032','Lima','Cañete','Pacaran');

INSERT INTO VENTA
(CODVENT,FECVENT,CODCLI,CODEMP,METSER)
VALUES
('0001','2022/03/10','0001','1025','1'),
('0002','2022/05/18','0002','1025','5'),
('0003','2022/05/20','0003','1025','6'),
('0004','2022/05/22','0004','1028','3'),
('0005','2022/05/25','0005','1028','9'),
('0006','2022/05/26','0006','1030','2'),
('0007','2022/05/27','0007','1029','7'),
('0008','2022/05/30','0008','1024','8'),
('0009','2022/06/01','0009','1029','4'),
('0010','2022/06/03','0010','1029','10');

insert into venta_detalle
(IDVENDET,CODVENT,CODMEN,CANTVENT)
VALUES
('1525','0001','1','3'),
('1526','0002','5','4'),
('1527','0003','5','2'),
('1528','0004','6','1'),
('1529','0005','7','1'),
('1530','0006','1','1'),
('1531','0007','4','6'),
('1532','0008','10','5'),
('1533','0009','10','8'),
('1534','0010','9','9');

select * from venta_detalle;
describe menu;

/* Relacionar */
ALTER TABLE CLIENTE
	ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (CODCLI) REFERENCES UBIGEO (CODCLI);
    
    
/* Eliminar columnas de una tabla */
ALTER TABLE CLIENTE
DROP COLUMN NOMBRE