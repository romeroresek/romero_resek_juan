# CURSO PROGRAMACIÓN WEB FULL STACK

# NIVEL 2

## Módulo 4 - Bases de datos

# Ejercicio 1:

Crear un diagrama de Entidad Relación partiendo de las siguientes entidades:

● ALUMNO (Cod_Matrícula, Nombre, DNI, FechaNacimiento, email)

● CURSO (Cód_Curso, Nombre)

● PROFESOR (Id_Profesor, Nombre, Especialidad, email)

Teniendo en cuenta que:

➔ Un alumno puede estar inscripto en uno o varios cursos.

➔ En un curso puede haber como mínimo 20 y como máximo 50 alumnos.

➔ Un curso es impartido por al menos uno o varios profesores.

➔ Un profesor podrá impartir varios cursos.

# Ejercicio 2:

Crear un diagrama de Entidad Relación partiendo de las siguientes entidades:

● PAIS ( ID_Pais, Nombre_Pais)

● PROVINCIA (ID_Provincia, Nombre_provincia)

● LOCALIDAD (Código_localidad, Nombre, Codigo_Postal)

● EMPLEADO (Id_Empleado, DNI, Nombre, Teléfono, Email, Fecha_alta)

Se requiere almacenar los datos de cada uno de los empleados, para ello:

➔ Un empleado vive en una sola localidad.

➔ Cada localidad pertenece a una única provincia.


```
➔ Cada provincia pertenece a un país.

➔ Se pueden repetir los nombres de las provincias y localidades pero no de los países.
```
# Ejercicio 3:

Se desea diseñar una base de datos sobre la información de las reservas de una empresa
dedicada al alquiler de automóviles teniendo en cuenta que:

➔ Un determinado cliente puede tener en un momento dado una o varias reservas.

➔ De cada cliente se desea almacenar su DNI, nombre, dirección y teléfono.

➔ Además dos clientes se diferencian por un único código.

➔ De cada reserva es importante registrar su número de identificación, la fecha de inicio
y final de la reserva, el precio total.

➔ De cada coche se requiere la matrícula, el modelo, el color y la marca. Cada coche tiene
un precio de alquiler por hora.

➔ Además en una reserva se pueden incluir varios coches de alquiler. Queremos saber los
coches que incluye cada reserva y los litros de gasolina en el depósito en el momento
de realizar la reserva, pues se cobrarán aparte.

➔ Cada cliente puede ser avalado por otro cliente de la empresa.

# Ejercicio 4:

A partir de los enunciados de los ejercicios anteriores. Crear un script SQL llamado
“ejercicio4.sql” capaz de:

● Crear las tablas con los campos.

● Crear las relaciones entre las tablas. Tener en cuenta que las relaciones se dan por que
existe al menos una PK y una FK

● Almacenar como mínimo 3 valores por cada tabla.

# Ejercicio 5:

Subir al repositorio público apellido_nombre en un solo PDF las respuestas 1, 2 y 3, puede ser
capturas de pantalla de los E/R. También agregar “ejercicio4.sql” al repo.


Bibliografía:

https://docs.google.com/presentation/d/1PMK1DbTSrAXOP7Yo75gWfbAGqsZaexiaYS-i0M9-zP
c/edit#slide=id.gfee51453ca_1_

https://drive.google.com/file/d/1lCZ9f_a8WDSa2vFkVA07JeqcM0mfLlgR/view?usp=sharing

Herramientas:

Pueden utilizar cualquier herramienta disponible en internet para realizar los diagramas
Entidad Relación. Algunas de las más conocidas son: Draw.io (es un complemento para drive),
,Gitmind, VisualParadigm, LucidChard, workbrench

Recuerden que para cualquier consulta el correo es:programacion.obera.silicon@gmail.com
