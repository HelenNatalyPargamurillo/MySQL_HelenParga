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
 
create table grado(
id int auto_increment primary key,
nombre varchar (100) not null
);

create table asignatura(
id int primary key,
nombre varchar(100)not null,
creditos float not null,
tipo enum('basica','obligatoria','optativa'),
curso tinyint(3) not null,
cuatrimestre tinyint (3) not null,
id_profesor int (10),
id_grado int (10)not null,
foreign key (id_profesor) references  profesor  (id_profesor),
foreign key (id_grado) references grado (id)
);

-- crear tabla de  curso escolar

create table curso_escolar(
id int(10) auto_increment primary key,
anyo_incio year(4),
anyo_fin year(4)
); 
-- crear tabla alumno escolar 
create table alumno_se_matricula_asignatura(
id_alumno int (10) auto_increment primary key,
id_asignature int (10) not null,
id_curso_escolar int(10) not null,
foreign key (id_alumno) references persona (id) ,
foreign key (id_asignatura) references asignatura (id),
foreign key (id_curso_escolar) references curso_escolar(id)
);

show tables;


 
 -- desarrollado por Helen Natalty Parga Murillo  / ID.1.001.301.103
 