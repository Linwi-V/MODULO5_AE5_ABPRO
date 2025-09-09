DROP DATABASE IF EXISTS eco_electronicos;
CREATE DATABASE IF NOT EXISTS eco_electronicos;
USE eco_electronicos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Articulos;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Solicitudes;
DROP TABLE IF EXISTS Vehiculos;


CREATE TABLE Articulos
(
  id_articulo INT  NOT NULL AUTO_INCREMENT,
  descripcion TEXT NOT NULL,
  cantidad    INT  NOT NULL CHECK (cantidad >= 0),
  precio      INT  NOT NULL CHECK (precio >= 0),
  PRIMARY KEY (id_articulo)
);

CREATE TABLE Clientes
(
  id_cliente INT          NOT NULL AUTO_INCREMENT,
  nombre     VARCHAR(100) NOT NULL,
  direccion  VARCHAR(150) NOT NULL,
  telefono   VARCHAR(15)  NOT NULL,
  correo     VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE Pedidos
(
  id_pedido   INT NOT NULL AUTO_INCREMENT,
  id_articulo INT NOT NULL,
  id_cliente  INT NOT NULL,
  precio      INT NOT NULL CHECK (precio >= 0),
  cantidad    INT NOT NULL CHECK (cantidad > 0),
  PRIMARY KEY (id_pedido)
);

CREATE TABLE Solicitudes
(
  id_solicitud    INT      NOT NULL AUTO_INCREMENT,
  id_pedido       INT      NOT NULL,
  id_vehiculo     INT      NOT NULL,
  fecha_retiro    DATETIME NOT NULL,
  fecha_solicitud DATETIME NOT NULL,
  PRIMARY KEY (id_solicitud)
);

CREATE TABLE Vehiculos
(
  id_vehiculo INT         NOT NULL AUTO_INCREMENT,
  patente     VARCHAR(10) NOT NULL,
  tipo        VARCHAR(30) NULL    ,
  capacidad   DECIMAL     NULL    CHECK (capacidad >= 0),
  disponible  BOOLEAN     NULL    ,
  PRIMARY KEY (id_vehiculo)
);

ALTER TABLE Vehiculos
  ADD CONSTRAINT UQ_patente UNIQUE (patente);

ALTER TABLE Pedidos
  ADD CONSTRAINT FK_Clientes_TO_Pedidos
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);

ALTER TABLE Pedidos
  ADD CONSTRAINT FK_Articulos_TO_Pedidos
    FOREIGN KEY (id_articulo)
    REFERENCES Articulos (id_articulo);

ALTER TABLE Solicitudes
  ADD CONSTRAINT FK_Pedidos_TO_Solicitudes
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id_pedido);

ALTER TABLE Solicitudes
  ADD CONSTRAINT FK_Vehiculos_TO_Solicitudes
    FOREIGN KEY (id_vehiculo)
    REFERENCES Vehiculos (id_vehiculo);




