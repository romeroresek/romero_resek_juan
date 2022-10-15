--Resolver las siguientes consultas utilizando la sintaxis SQL
--DATABASE ventas 
--1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM ventas.pedidos ORDER BY fecha desc

--2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM ventas.pedidos ORDER BY cantidad desc limit 2

--3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT clientes.id AS clientes_id FROM ventas.clientes INNER JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente

--4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.
SELECT * FROM ventas.pedidos WHERE YEAR(fecha)='2022' AND cantidad>'500'

--5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
SELECT vendedores.nombre, vendedores.apellido FROM ventas.vendedores WHERE comision BETWEEN '0.05' AND '0.11';

--6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
SELECT MAX(vendedores.comision) FROM ventas.vendedores

--7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT clientes.id, clientes.nombre, clientes.apellido FROM ventas.clientes WHERE cuitcuil IS NOT NULL ORDER BY clientes.apellido asc, clientes.nombre asc

--8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
SELECT clientes.nombre FROM ventas.clientes WHERE (nombre LIKE'A%' and nombre LIKE'%n')  OR nombre LIKE'P%' ORDER BY clientes.apellido asc, clientes.nombre asc

--9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
SELECT clientes.nombre FROM ventas.clientes WHERE nombre NOT LIKE'A%' ORDER BY clientes.apellido asc, clientes.nombre asc

--10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT vendedores.nombre FROM ventas.vendedores WHERE nombre LIKE'%el' OR nombre LIKE'%o' ORDER BY vendedores.nombre asc

--11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT clientes.id AS clientes_id, clientes.nombre, clientes.apellido FROM ventas.clientes INNER JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente ORDER BY clientes.apellido asc, clientes.nombre asc

--12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT pedidos.id AS pedidos_id FROM ventas.pedidos INNER JOIN ventas.clientes ON ventas.pedidos.id=ventas.clientes.id

--13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT * FROM ventas.pedidos INNER JOIN ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id ORDER BY vendedores.apellido asc, vendedores.nombre asc

--14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los vendedores asociados a cada pedido.
SELECT * FROM ventas.pedidos
INNER JOIN ventas.clientes ON ventas.clientes.id=ventas.pedidos.id_cliente 
INNER JOIN ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id

--15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300  y $1000.
SELECT * FROM ventas.pedidos
INNER JOIN ventas.clientes ON ventas.clientes.id=ventas.pedidos.id_cliente 
WHERE YEAR(fecha)='2022' AND cantidad BETWEEN '300' AND '1000';


--16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana.
SELECT DISTINCT vendedores.nombre, vendedores.apellido FROM ventas.pedidos
INNER JOIN ventas.clientes ON ventas.clientes.id=ventas.pedidos.id_cliente 
INNER JOIN ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id
WHERE clientes.nombre='María' and clientes.apellido='Santana'

--17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
SELECT DISTINCT clientes.nombre FROM ventas.pedidos
INNER JOIN ventas.clientes ON ventas.clientes.id=ventas.pedidos.id_cliente 
INNER JOIN ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id
WHERE vendedores.nombre='Daniel' and vendedores.apellido='Sáez'

--18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT DISTINCT * FROM ventas.clientes
LEFT JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente 
ORDER BY clientes.apellido asc, clientes.nombre asc

--19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. Este listado también debe incluir los vendedores que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
SELECT DISTINCT * FROM ventas.vendedores
LEFT JOIN ventas.pedidos ON ventas.vendedores.id=ventas.pedidos.id_vendedor 
ORDER BY vendedores.apellido asc, vendedores.nombre asc

--20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT * FROM ventas.clientes
left JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente
where ventas.pedidos.id_cliente is null

--21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT * FROM ventas.vendedores
left JOIN ventas.pedidos ON ventas.vendedores.id=ventas.pedidos.id_vendedor
where ventas.pedidos.id_vendedor is null

--segunda solución
SELECT * FROM ventas.pedidos
right JOIN ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id where pedidos.id is null

--22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
SELECT vendedores.nombre, vendedores.apellido, '' as cliente_id, vendedores.id as vendedor_id FROM ventas.pedidos 
right JOIN ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id  
where ventas.pedidos.id_vendedor is null   
union  
SELECT clientes.nombre, clientes.apellido, clientes.id as cliente_id, '' FROM ventas.pedidos
right JOIN ventas.clientes ON ventas.pedidos.id_cliente=ventas.clientes.id  
where ventas.pedidos.id_cliente is null
ORDER BY apellido asc, nombre asc

--23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT sum(cantidad) as "Total Cantidad" FROM ventas.pedidos 

--24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(cantidad) as "Cantidad Media" FROM ventas.pedidos 

--25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
SELECT count(distinct pedidos.id_vendedor) as Nro_vendedores FROM ventas.pedidos 

--26.Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT count(ventas.clientes.id) FROM ventas.clientes 

--27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT max(ventas.pedidos.cantidad) FROM ventas.pedidos

--28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT min(ventas.pedidos.cantidad) FROM ventas.pedidos

--29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT max(clientes.categoría), clientes.ciudad from ventas.clientes  group BY ciudad

--30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT max(pedidos.cantidad) as Max_Pedido, fecha, id_cliente, clientes.nombre, clientes.apellido  from ventas.pedidos 
inner join ventas.clientes ON ventas.clientes.id=ventas.pedidos.id_cliente
group by ventas.pedidos.id_cliente, ventas.pedidos.fecha

--31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
SELECT max(pedidos.cantidad) as Max_Pedido, fecha, id_cliente, clientes.nombre, clientes.apellido  from ventas.pedidos 
inner join ventas.clientes ON ventas.clientes.id=ventas.pedidos.id_cliente where pedidos.cantidad>'2000'
group by ventas.pedidos.id_cliente, ventas.pedidos.fecha

--32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
SELECT pedidos.fecha Fecha, max(pedidos.cantidad) as Max_Pedido_día, sum(pedidos.cantidad) as Total_pedidos_día, vendedores.id as Id_Vendedor,vendedores.apellido Apellido, vendedores.nombre as Nombre from ventas.pedidos 
inner join ventas.vendedores ON ventas.pedidos.id_vendedor=ventas.vendedores.id
where ventas.pedidos.fecha='2021-08-17' group by ventas.pedidos.id_vendedor

--33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT clientes.id, clientes.nombre, clientes.apellido,count(pedidos.id) as Cant_pedidos FROM ventas.clientes
LEFT JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente group by clientes.id order by Cant_pedidos desc

--34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado cada uno de clientes durante el año 2020.
SELECT clientes.id as Id_Cliente, clientes.nombre, clientes.apellido,count(pedidos.id) as Cant_pedidos FROM ventas.clientes
LEFT JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente 
where YEAR(fecha)='2020'
group by clientes.id order by Cant_pedidos desc

--35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT YEAR(pedidos.fecha) Año, max(pedidos.cantidad) as Pedido_Max 
FROM ventas.pedidos 
group by YEAR(fecha)

--36.Devuelve el número total de pedidos que se han realizado cada año.
SELECT YEAR(pedidos.fecha) Año, count(pedidos.id) as Cant_Pedidos
FROM ventas.pedidos 
group by YEAR(fecha)

--37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
SELECT pedidos.id as Id_pedido_Adela
FROM ventas.pedidos
cross join ventas.clientes
where pedidos.id_cliente=clientes.id and clientes.nombre='Adela' and clientes.apellido='Salas'

--38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáez. (Sin utilizar INNER JOIN)
SELECT pedidos.id,pedidos.fecha,  vendedores.nombre, vendedores.apellido as Id_pedido_Adela
FROM ventas.pedidos
cross join ventas.vendedores
where pedidos.id_vendedor=vendedores.id and vendedores.nombre='Daniel' and vendedores.apellido='Sáez'

--39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
SELECT clientes.id, max(pedidos.cantidad), YEAR(pedidos.fecha), clientes.nombre, clientes.apellido
FROM ventas.pedidos
cross join ventas.clientes
where pedidos.id_cliente=clientes.id and YEAR(fecha)='2020'

--40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT clientes.id Cliente_id, min(pedidos.cantidad) Menor_pedido, YEAR(pedidos.fecha), clientes.nombre, clientes.apellido
FROM ventas.pedidos
cross join ventas.clientes
where pedidos.id_cliente=clientes.id and clientes.nombre='Pepe' AND clientes.apellido='Ruiz'

--41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM ventas.clientes
left JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente
where coalesce(ventas.pedidos.id_cliente,'') IN ('')

--42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM ventas.vendedores
left JOIN ventas.pedidos ON ventas.vendedores.id=ventas.pedidos.id_vendedor
where coalesce(ventas.pedidos.id_vendedor,'') IN ('')

--43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM ventas.clientes
left JOIN ventas.pedidos ON ventas.clientes.id=ventas.pedidos.id_cliente
WHERE EXISTS
(SELECT * FROM ventas.clientes WHERE ventas.pedidos.id_cliente is null);


--44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM ventas.vendedores
left JOIN ventas.pedidos ON ventas.vendedores.id=ventas.pedidos.id_vendedor
WHERE EXISTS
(SELECT * FROM ventas.vendedores WHERE ventas.pedidos.id_vendedor is null);