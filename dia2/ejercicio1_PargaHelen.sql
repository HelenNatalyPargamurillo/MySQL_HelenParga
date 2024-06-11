-- ################
-- ##### dia2 - comandos geenrales ##
-- #############

-- comando generales para revision dse bases de datos creados 
show databases;
 -- crear base de datos 
 
 create database dia2;
 -- utilizar BBDD  DIA 2
 
 USE dia2;
 -- crear tabla departamento 
 
 -- create tabla departamento 
 
 create table departamento (
	id int auto_increment primary key,
    nombre varchar (50) not null
    );
    
-- create tabla persona 

create table persona(
 id int auto_increment primary key,
 nif varchar (9),
 nombre varchar(25) not null,
 apellido1 varchar (50)not null,
 apellido2 varchar (50),
 ciudad  varchar (25) not null,
 direccion varchar (50)not null,
 telefono varchar (10),
 fecha_nacimiento date not null,
 sexo enum('H','M')not null,
 tipo enum ('profesor','alumno')
 );
 create table profesor (
 id_profesor int primary key ,
 id_departamento int not null,
 foreign key (id_profesor) references persona(id),
 foreign key (id_departament) references departamento(id)
 );
 
 -- desarrollado por Helen Natalty Parga Murillo  / ID.1.001.301.103
 