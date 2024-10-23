--consulta
SELECT productos.nombre AS nombre_de_productos, 
operaciones.tipo AS tipo_de_operaciones,
operaciones.cantidad AS cantidad_de_productos
FROM productos
JOIN operaciones
ON productos.id = operaciones.id_producto;

--lo mismo de arriba pero tabla
CREATE TABLE movimientos_de_productos AS
SELECT productos.nombre AS nombre_de_productos, 
operaciones.tipo AS tipo_de_operaciones,
operaciones.cantidad AS cantidad_de_productos
FROM productos
JOIN operaciones
ON productos.id = operaciones.id_producto;

--supongamos que quiero crear una tabla que agrupe y concatene las operaciones

DROP TABLE movimientos_de_productos ;

CREATE TABLE movimientos_de_productos AS
SELECT productos.nombre AS nombre_de_productos, 
GROUP_CONCAT(CONCAT(operaciones.tipo, ' - ', operaciones.cantidad)) AS operaciones_cantidades
FROM productos
JOIN operaciones
ON productos.id = operaciones.id_producto
GROUP BY productos.nombre;