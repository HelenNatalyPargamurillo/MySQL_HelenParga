-- #########
-- ### dia 3 #####
-- #############


-- comando generales para revision de base de datos creados 
show databases;
 Create  database dia3;
-- utilizar BBDD DIA3 
USE dia3;
-- creacion de tabla gama producto 
create table gama_producto(
id  varchar(50) primary key,
description_texto text null,
desccription_html text null,
imagen varchar(256) null
);
-- creacion de tabla produto
create table producto(
id_producto varchar(15) primary key,
nombre varchar(70) not null,
id_gama varchar(50) null,
foreign key (id_gama) references gama_producto (id),
dimenciones  varchar(25) null,
proveedor varchar (50)null,
descripcion text null,
cantidad_en_stock smallint(6) not null,
precio_venta decimal(15,2)not null,
precio_provvedor decimal(15.2)null
 ); 
-- ofina empleado cliente pedido detalle 
create table oficina (
id_oficina varchar (10),
ciudad varchar (30) not null,
pais varchar (50) not null,
region varchar (50)null,
codigo_postal varchar(10)null,
telefono varchar (20) not null,
linea_direccion1 varchar (50) not null,
linea_direccion2 varchar (50) null
);

create table empleado (
id_codigo_empleado int primary key,
nombre varchar (50) not null,
apellido1 varchar (50) not null,
apellido2 varchar (50) null,
extencion varchar(10) not null,
email varchar (100) not null,
id_oficina varchar (10) not null ,
foreign key (id_oficina) references oficina (id),
id_jefe int null,
foreign key (id_jefe) references empleado (id),
puesto varchar (50) 
);

create table cliente (
id_codigo_cliente int primary key,
nombre_contacto varchar (50) not null,
apellido_contacto varchar (30)null,
telefono varchar (15) not null,
fax varchar (15) not null,
linea_direccion1 varchar (50) not null,
linea_direccion2 varchar (50) null,
ciudad varchar (50)not null,
region varchar (50) null,
pais varchar (50) null,
codigo_postal varchar (10) null,
limite_credito decimal(15.2) null,
codigo_empleado_rep_ventas int,
foreign key (codigo_empleado_rep_ventas) references empleado(codigo_empleado)
);

create table pedido (
codigo_pedido int primary key not null ,
fecha_pedido date not null,
fecha_esperada date not null,
fecha_entrega  date null,
estado varchar (15) not null,
comenatrios text null,
id_codigo_cliente int not null,
foreign key (id_codigo_cliente) references cliente (id_codigo_cliente)
);
create table detalle_pedido(
codigo_pedio int not null,
codigo_producto varchar (15) not null primary key,
cantidad int(11) not null,
precio_unidad decimal (15.2) not null,
numero_lineal smallint(6) not null,
primary key (codigo_pedido,codigo_producto),
foreign key (codigo_producto) references producto (codigo_producto),
foreign key (codigo_producto) references producto (codigo_producto)
);
 create table pago (
 codigo_cliente int not null,
 forma_pago varchar (40) not null,
 id_transaccion varchar (40) primary key,
 fecha_pago date not null,
 total decimal (15.2) not null,
 primary key (codigo_cliente,id_tramsaccon),
 foreign key (codigo_cliente) references cliente (codigo_cliente)
 );
 -- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
 select codigo_oficina, ciudad from oficina; 
 -- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España
 select ciudad ,telefono  from oficina where pais  = 'España';
 -- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
 select  nombre,apellido1,apellido2,email from empleado e where e.codigo_jefe=7;
 -- 4.Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
 select puesto, nombre, apellido1, apellido2, email
 from empleado e
 where e.codigo_jefe is null;
 -- 5 Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct p.estado from pedido p;

 
 