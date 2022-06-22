/* Crear base de datos */
CREATE DATABASE dbGourmandKing;

/* Poner en uso la base de datos */
USE dbGourmandKing;

/* Crear tabla Pedido */
CREATE TABLE Pedido
(
     IDPED int AUTO_INCREMENT,
     USERPED varchar(80),
     EMAUSER varchar(80),
     CELUUSER char(9),
     MENPED varchar(80),
     MSGPED   varchar(250),
     PRIMARY KEY (IDPED)
);

/* Insertar registros */
INSERT INTO PEDIDO
(USERPED, EMAUSER, CELUUSER, MENPED, MSGPED)
VALUES
('José Ramírez', 'jose.ramirez@outlook.com', '974815236', 'Arroz con Pollo', 'Por favor enviar a la dirección Av. Miraflores 253, San Vicente de Cañete'),
('Ana Guerra Solano', 'ana.guerra@gmail.com', '981526321', 'Sopa Seca', 'Necesito 4 platos');

/* Listar los registros de la tabla PEDIDO */
SELECT * FROM PEDIDO;