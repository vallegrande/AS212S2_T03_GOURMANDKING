/*crear db de gourmandking*/
create database dbGourmandKing;

/*Usar db de gourmandking*/
use dbGourmandKing;

/*Tabla Ubigeo*/
create table UBIGEO
(
	CODUBI char(6),
    DEPUBI VARCHAR(80),
    PROVUBI VARCHAR(80),
    DISUBI VARCHAR(80),
    CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
);

/*Tabla Menu*/
create table MENU
(
	CODMEN char(6),
    PREMEN decimal(8,2),
    ENTMEN VARCHAR(50),
    SEGUMEN VARCHAR(50),
    BEBMEN VARCHAR(50),
    CONSTRAINT CODMEN_PK PRIMARY KEY (CODMEN)
);

/*Tabla Empleado*/
CREATE TABLE EMPLEADO
(
	CODEMP char(6),
    NOMEMP VARCHAR(50),
    APEEMP VARCHAR(50),
    DNIEMP VARCHAR(8),
    CELEMP VARCHAR(9),
    UBIEMP char(6),
    CONSTRAINT CODEMP_PK PRIMARY KEY (CODEMP)
);

/*Tabla Cliente*/
CREATE TABLE CLIENTE
(
	CODCLI char(6),
    NOMCLI VARCHAR(50),
    APECLI VARCHAR(50),
    DNICLI CHAR(8),
    EMACLI VARCHAR(300),
    CELCLI CHAR(9),
    UBICLI char(6),
     CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

/*Tabla Venta*/
CREATE TABLE VENTA
(
	IDVENT INT auto_increment,
    FECVENT DATE,
    CODCLI char(6),
    CODEMP char(6),
    METSER char(2),
     CONSTRAINT IDVENT_PK PRIMARY KEY (IDVENT)
);

/*Tabla Venta detalle*/
CREATE TABLE VENTA_DETALLE
(
	IDVENDET int,
    IDVENT INT,
    CODMEN char(6),
    CANTVENDET INT,
    CONSTRAINT IDVENDET_PK PRIMARY KEY (IDVENDET)
);

/* Relacionar Ubigeo */
ALTER TABLE CLIENTE
	ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (UBICLI) REFERENCES UBIGEO (CODUBI);
ALTER TABLE EMPLEADO
	ADD CONSTRAINT EMPLEADO_UBIGEO FOREIGN KEY (UBIEMP) REFERENCES UBIGEO (CODUBI);
    
/* Relacionar Venta*/
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_EMPLEADO FOREIGN KEY (CODEMP) REFERENCES EMPLEADO (CODEMP);
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI);

/* Relacionar Venta_DETALLE*/
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (IDVENT) REFERENCES VENTA (IDVENT);
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_MENU FOREIGN KEY (CODMEN) REFERENCES MENU (CODMEN);

/* Insertar registros Menu */
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

/*Insertar registros empleado*/
insert into empleado
(CODEMP,NOMEMP,APEEMP,DNIEMP,CELEMP,UBIEMP)
VALUES
('e1025','Juan Arturo','Vasquez Vasquez','54628750','976235698','140401'),
('e1026','Pedro','Bravo Tesen','25642540','975456985','140402'),
('e1027','Steven Manuel','Martinez Cubas','25415780','9741235489','140403'),
('e1028','Blanca Belen','Loayza Velasquez','21564870','976123456','140404'),
('e1029','Araveli','Vargas Olano','23651484','976458756','140405'),
('e1030','Anthony','Catón Jibaja','25469872','976548752','140406'),
('e1031','Daniel','Ventura Yangua','23156487','9761245784','140407'),
('e1037','Mario Eduardo','Chamorro Veliz','12458747','974231564','140408'),
('e1033','Vanessa Lupita','Tsucamoto Vasquez','23659874','975213658','140409'),
('e1032','Nathaly Mariel','Cabrera Soberon','12032055','998215489','140410');

/*Insertar registros cliente*/
insert into cliente
(CODCLI,NOMCLI,APECLI,DNICLI,EMACLI,CELCLI,UBICLI)
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

/*Insertar registros ubigeo*/
insert into ubigeo
(CODUBI,DEPUBI,PROVUBI,DISUBI)
VALUES
('140401','Lima','Cañete','San Vicente de Cañete'),
('140402','Lima','Cañete','Calango'),
('140403','Lima','Cañete','Cerro Azul'),
('140404','Lima','Cañete','Coayllo'),
('140405','Lima','Cañete','Chilca'),
('140406','Lima','Cañete','Imperial'),
('140407','Lima','Cañete','Lunahuana'),
('140408','Lima','Cañete','Mala'),
('140409','Lima','Cañete','Nuevo Imperial'),
('140410','Lima','Cañete','Pacaran');

/*Insertar registros venta*/
INSERT INTO VENTA
(IDVENT,FECVENT,CODCLI,CODEMP,METSER)
VALUES
('V0001','2022/03/10','0001','e1025','1'),
('V0002','2022/05/18','0002','e1026','5'),
('V0003','2022/05/20','0003','e1027','6'),
('V0004','2022/05/22','0004','e1028','3'),
('V0005','2022/05/25','0005','e1029','9'),
('V0006','2022/05/26','0006','e1030','2'),
('V0007','2022/05/27','0007','e1031','7'),
('V0008','2022/05/30','0008','e1037','8'),
('V0009','2022/06/01','0009','e1032','4'),
('V0010','2022/06/03','0010','e1032','10');

/*Insertar registros venta detalle*/
insert into venta_detalle
(IDVENDET,IDVENT,CODMEN,CANTVENDET)
VALUES
('1525','V0001','1','3'),
('1526','V0002','2','4'),
('1527','V0003','3','2'),
('1528','V0004','4','1'),
('1529','V0005','5','1'),
('1530','V0006','6','1'),
('1531','V0007','7','6'),
('1532','V0008','8','5'),
('1533','V0009','9','8'),
('1534','V0010','10','9');

SELECT * FROM ubigeo;
SELECT * FROM cliente;
SELECT * FROM empleado;
SELECT * FROM venta;
SELECT * FROM menu;
SELECT * FROM venta_detalle;
drop database dbgourmandking;
