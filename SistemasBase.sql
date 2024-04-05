-- SCHEMA: pr1

-- DROP SCHEMA IF EXISTS pr1 ;

CREATE SCHEMA IF NOT EXISTS pr1
    AUTHORIZATION postgres;
	
CREATE SCHEMA pr1;

---tabla usuario----
CREATE TABLE pr1.usuarios(
id_usuario int PRIMARY KEY,
nombre varchar  not null,
apellido varchar not null,
email varchar not null,
contraseña varchar not null
);


---tabla productos---
CREATE TABLE pr1.productos (
id_producto int PRIMARY KEY,
nombre VARCHAR not null,
descripcion varchar,
precio varchar,
id_categoria int,
FOREIGN KEY (id_categoria) REFERENCES pr1.categorias(id_categoria)
);


---tabla categorias----
CREATE TABLE pr1.categorias (
id_categoria int PRIMARY KEY,
nombre varchar
);


---tabla pedidos-----
CREATE TABLE pr1.pedidos (
id_pedidos int  PRIMARY KEY,
id_usuario int not null,
fecha date not null,
total varchar not null,
FOREIGN KEY (id_usuario) REFERENCES pr1.usuarios(id_usuario)
);

---tabla detalles del pedido---
CREATE TABLE pr1.detallesPedido (
id_detalle int PRIMARY KEY,
id_pedidos int not null,
id_producto int not null,
cantidad int not null,
subtotal varchar not null,
FOREIGN KEY (id_pedidos) REFERENCES pr1.pedidos(id_pedidos),
FOREIGN KEY (id_producto) REFERENCES pr1.productos(id_producto)
);

--- tabla direcciones---
CREATE TABLE pr1.direcciones (
id_direccion int PRIMARY KEY,
id_usuario int not null,
calle varchar not null,
numero varchar not null,
ciudad varchar not null,
estado varchar not null,
pais varchar not null,
codigo_postal varchar not null,
FOREIGN KEY (id_usuario) REFERENCES pr1.usuarios(id_usuario)
);

