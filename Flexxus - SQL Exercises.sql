########## FLEXXUS - ENTREVISTA TÉCNICA ##########

create database entrevista_flexxus;
use entrevista_flexxus;
create table EMPLEADOS(
APELLIDO varchar(80),
COMISION double,
DEPARTAMENTO_ID int,
EDAD int,
FECHAALTA date,
ID int not null, 
NOMBRES varchar(80),
PUESTO_ID int,
SUELDO double,
primary key(ID),
foreign key(PUESTO_ID) references PUESTOS(ID),
foreign key(DEPARTAMENTO_ID) references DEPARTAMENTOS(ID)
);

create table PUESTOS(
ACTIVO int,
ID int not null,
PUESTO varchar(80),
primary key(ID)
);

create table DEPARTAMENTOS(
DENOMINACION varchar(80),
ID int not null,
LOCALIDAD_ID int,
primary key(ID),
foreign key(LOCALIDAD_ID) references LOCALIDADES(ID)
);

create table LOCALIDADES(
ACTIVO int,
ID int not null,
LOCALIDAD varchar(80),
primary key(ID)
);

show tables in entrevista_flexxus;
insert into EMPLEADOS values('PICAPIEDRA', 15, 15, 45, 20051230, 115, 'PEDRO', 500, 2500);
insert into EMPLEADOS values('MARMOL', 25, 10, 43, 20150310, 121, 'PABLO', 300, 2000);
insert into EMPLEADOS values('LANDA', 7, 10, 24, 20210315, 131, 'LALO', 500, 900);
insert into EMPLEADOS values('MCCARTNEY', 55, 15, 69, 19990228, 142, 'PAUL', 600, 4500);
insert into EMPLEADOS values('QUITO', 5, 10, 33, 20051106, 91, 'ESTEBAN', 500, 3000);
insert into EMPLEADOS values('LESTO', 17, 10, 42, 20080719, 53, 'ELMO', 700, 2500);
insert into EMPLEADOS values('PAREDES', 15, 10, 53, 20051031, 42,  'ARMANDO', 500, 2500);
insert into EMPLEADOS values('CASTRO', 30, 10, 68, 19981231, 196, 'FIDEL', 900, 3700);
insert into EMPLEADOS values('DELMARIDODEPAMPITA', 11, 14, 45, 20051230, 57, 'TIO', 400, 25000);
insert into EMPLEADOS values('DARWIN', 19.5, 10, 25, 20181215, 110, 'CARLITOS', 500, 1300);
select * from EMPLEADOS;
update EMPLEADOS set DEPARTAMENTO_ID = 8 where DEPARTAMENTO_ID = 15;
update EMPLEADOS set SUELDO = 11000 where SUELDO = 900;
update EMPLEADOS set PUESTO_ID = 6 where PUESTO_ID = 900;
update EMPLEADOS set PUESTO_ID = 3 where PUESTO_ID = 300;
update EMPLEADOS set PUESTO_ID = 2 where PUESTO_ID = 700;


insert into PUESTOS values(136, 7, 'ANALISTA');
insert into PUESTOS values(215, 6, 'PROGRAMADOR');
insert into PUESTOS values(25, 3, 'QA');
insert into PUESTOS values(13, 2, 'MANTENIMIENTO');
insert into PUESTOS values(9, 4, 'RRHH');
select * from PUESTOS;
update PUESTOS set ID = 500 where ID = 7;

insert into DEPARTAMENTOS values('SOPORTE', 11, '5000');
insert into DEPARTAMENTOS values('CONTADURIA', 10, '5010');
insert into DEPARTAMENTOS values('ABOGACIA', 9, '5000');
select * from DEPARTAMENTOS;
update DEPARTAMENTOS set ID = 8 where ID = 10;
update DEPARTAMENTOS set ID = 10 where ID = 11;
delete from DEPARTAMENTOS where ID = 11; 

insert into LOCALIDADES values(351, 5000, 'CORDOBA');
insert into LOCALIDADES values(3541, 5010, 'CARLOS PAZ');
insert into LOCALIDADES values(358, 5800, 'RIO CUARTO');
select * from LOCALIDADES;


########################################################################################################################################################################################
########################################################################################################################################################################################


########## Mostrar los nombres de los empleados ordenados alfabéticamente (Z...A). ##########
select * from EMPLEADOS order by NOMBRES DESC;

########## Seleccionar el nombre, el puesto y la localidad donde trabajan los empleados con departamento de 'Soporte'. ##########
select EMPLEADOS.NOMBRES, PUESTOS.PUESTO, LOCALIDADES.LOCALIDAD
from DEPARTAMENTOS inner join LOCALIDADES on DEPARTAMENTOS.LOCALIDAD_ID = LOCALIDADES.ID
inner join EMPLEADOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
inner join PUESTOS on EMPLEADOS.PUESTO_ID = PUESTOS.ID
where DEPARTAMENTOS.DENOMINACION = 'SOPORTE';

########## Listar los nombres de los empleados cuyo nombre termine con la letra "o". ##########
select * from EMPLEADOS where right(NOMBRES, 1) = 'o';

########## Seleccionar el nombre, el puesto y sueldo de los empleados que trabajan en la localidad Carlos Paz. ##########
select EMPLEADOS.NOMBRES, PUESTOS.PUESTO, EMPLEADOS.SUELDO
from DEPARTAMENTOS inner join LOCALIDADES on DEPARTAMENTOS.LOCALIDAD_ID = LOCALIDADES.ID
inner join EMPLEADOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
inner join PUESTOS on EMPLEADOS.PUESTO_ID = PUESTOS.ID
where LOCALIDADES.LOCALIDAD = 'CARLOS PAZ';

########## Seleccionar el nombre, sueldo y localidad donde trabajan de los empleados que tengan un sueldo entre 10000 y 13000. ##########
select EMPLEADOS.NOMBRES, EMPLEADOS.SUELDO, LOCALIDADES.LOCALIDAD
from DEPARTAMENTOS inner join EMPLEADOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
inner join LOCALIDADES on DEPARTAMENTOS.LOCALIDAD_ID = LOCALIDADES.ID
where EMPLEADOS.SUELDO >= 10000 and EMPLEADOS.SUELDO <= 13000;

########## Visualizar los departamentos con más de 5 empleados. ##########
select DEPARTAMENTOS.DENOMINACION, count(EMPLEADOS.DEPARTAMENTO_ID) as 'PERSONAL'
from EMPLEADOS inner join DEPARTAMENTOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
group by DEPARTAMENTOS.DENOMINACION
having count(EMPLEADOS.DEPARTAMENTO_ID) > 5;

########## Nombre de los empleados que trabajan en Córdoba y cuyo puesto sea ‘Analista’ o ‘Programador’. ##########
select EMPLEADOS.NOMBRES
from DEPARTAMENTOS inner join LOCALIDADES on DEPARTAMENTOS.LOCALIDAD_ID = LOCALIDADES.ID
inner join EMPLEADOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
inner join PUESTOS on EMPLEADOS.PUESTO_ID = PUESTOS.ID
where LOCALIDAD = 'CORDOBA' and (PUESTO = 'ANALISTA' or PUESTO = 'PROGRAMADOR');

########## Calcula el sueldo medio de todos los empleados. ##########
select avg(SUELDO) from EMPLEADOS;

########## ¿Cuál es el máximo sueldo de los empleados del departamento 10? ##########
select max(SUELDO) from EMPLEADOS where DEPARTAMENTO_ID = 10;

########## Calcula el sueldo mínimo de los empleados del departamento ‘Soporte’. ##########
select min(SUELDO)
from EMPLEADOS inner join DEPARTAMENTOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
where DEPARTAMENTOS.DENOMINACION = 'SOPORTE';

########## Para cada puesto obtener la suma de sueldos. ##########
select PUESTOS.PUESTO, sum(EMPLEADOS.SUELDO) as 'TOTAL SALARIOS'
from EMPLEADOS inner join PUESTOS on PUESTOS.ID = EMPLEADOS.PUESTO_ID
group by PUESTOS.PUESTO;
