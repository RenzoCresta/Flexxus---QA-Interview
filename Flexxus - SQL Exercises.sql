########## FLEXXUS - ENTREVISTA TÉCNICA ##########

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

########## Seleccionar el nombre, sueldo y localidad donde trabajan de los empleados que tengan un sueldo entre 10000 y 13000.##########
select EMPLEADOS.NOMBRES, EMPLEADOS.SUELDO, LOCALIDADES.LOCALIDAD
from DEPARTAMENTOS inner join EMPLEADOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
inner join LOCALIDADES on DEPARTAMENTOS.LOCALIDAD_ID = LOCALIDADES.ID
where EMPLEADOS.SUELDO >= 10000 and EMPLEADOS.SUELDO <= 13000;

########## Visualizar los departamentos con más de 5 empleados.##########
select DEPARTAMENTOS.DENOMINACION, count(EMPLEADOS.DEPARTAMENTO_ID) as 'PERSONAL'
from EMPLEADOS inner join DEPARTAMENTOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
group by DEPARTAMENTOS.DENOMINACION
having count(EMPLEADOS.DEPARTAMENTO_ID) > 5;

########## Nombre de los empleados que trabajan en Córdoba y cuyo puesto sea ‘Analista’ o ‘Programador’.##########
select EMPLEADOS.NOMBRES
from DEPARTAMENTOS inner join LOCALIDADES on DEPARTAMENTOS.LOCALIDAD_ID = LOCALIDADES.ID
inner join EMPLEADOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
inner join PUESTOS on EMPLEADOS.PUESTO_ID = PUESTOS.ID
where LOCALIDAD = 'CORDOBA' and (PUESTO = 'ANALISTA' or PUESTO = 'PROGRAMADOR');

##########Calcula el sueldo medio de todos los empleados.##########
select avg(SUELDO) from EMPLEADOS;

##########¿Cuál es el máximo sueldo de los empleados del departamento 10?##########
select max(SUELDO) from EMPLEADOS where DEPARTAMENTO_ID = 10;

##########Calcula el sueldo mínimo de los empleados del departamento ‘Soporte’.##########
select min(SUELDO)
from EMPLEADOS inner join DEPARTAMENTOS on DEPARTAMENTOS.ID = EMPLEADOS.DEPARTAMENTO_ID
where DEPARTAMENTOS.DENOMINACION = 'SOPORTE';

##########Para cada puesto obtener la suma de sueldos.##########
select PUESTOS.PUESTO, sum(EMPLEADOS.SUELDO) as 'TOTAL SALARIOS'
from EMPLEADOS inner join PUESTOS on PUESTOS.ID = EMPLEADOS.PUESTO_ID
group by PUESTOS.PUESTO;
