DELETE FROM tipo_operaciones;  -- Elimina todos los registros de la tabla

ALTER TABLE tipo_operaciones AUTO_INCREMENT = 1;  -- Resetea el valor de AUTO_INCREMENT a 1

-- Insertar datos en la tabla tipo_operaciones
INSERT INTO tipo_operaciones (nombre, descripcion, afectacion_inventario) VALUES
('Compra', 'Compra de productos para stock', 'suma'),
('Devolución de cliente', 'Devolución de cliente de productos defectuosos', 'suma'),
('Devolución a proveedores', 'Devolución a proveedores de productos defectuosos', 'resta'),
('Venta', 'Venta de productos a clientes', 'resta'),
('Ajuste suma', 'Ajuste positivo de inventario', 'suma'),
('Ajuste resta', 'Ajuste negativo de inventario', 'resta'),
('Desecho', 'Eliminación de productos no utilizables', 'resta');

DELETE FROM categoria;  -- Elimina todos los registros de la tabla

ALTER TABLE categoria AUTO_INCREMENT = 1;  -- Resetea el valor de AUTO_INCREMENT a 1

-- Insertar datos en la tabla categorias
INSERT INTO categoria (nombre, descripcion) VALUES
('Electrónica', 'Productos electrónicos como laptops, móviles y tablets'),
('Accesorios', 'Accesorios para computadoras como teclados y ratones'),
('Audio', 'Equipos de sonido y auriculares'),
('Oficina', 'Productos para oficina como impresoras y muebles'),
('Almacenamiento', 'Dispositivos de almacenamiento como discos duros'),
('Muebles', 'Muebles como sillas y escritorios'),
('Iluminación', 'Productos relacionados con luces y lámparas'),
('Ropa', 'Prendas de vestir y accesorios de moda'),
('Deportes', 'Equipos y accesorios para deportes'),
('Juguetes', 'Juguetes para niños de todas las edades');


DELETE FROM productos;  -- Elimina todos los registros de la tabla

ALTER TABLE productos AUTO_INCREMENT = 1;  -- Resetea el valor de AUTO_INCREMENT a 1

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, descripcion, precio, cantidad, id_categoria) VALUES
-- Electrónica (id_categoria = 1)
('Laptop', 'Laptop con procesador Intel i5', 750.99, 10, 1),   
('Teléfono móvil', 'Teléfono Android con pantalla de 6.5 pulgadas', 399.50, 25, 1),
('Monitor 24 pulgadas', 'Monitor Full HD con panel IPS', 189.99, 8, 1),
('Tablet', 'Tablet de 10 pulgadas con 64GB de almacenamiento', 329.99, 12, 1),
-- Accesorios (id_categoria = 2)
('Teclado mecánico', 'Teclado mecánico con retroiluminación LED', 85.75, 15, 2),
('Mouse inalámbrico', 'Mouse óptico con conectividad Bluetooth', 25.40, 50, 2),
('Cargador rápido', 'Cargador rápido para dispositivos móviles', 20.99, 100, 2),
('Funda para laptop', 'Funda protectora para laptops de hasta 15 pulgadas', 18.99, 50, 2),
-- Audio (id_categoria = 3)
('Auriculares', 'Auriculares con cancelación de ruido', 120.99, 30, 3),
('Altavoz Bluetooth', 'Altavoz portátil con conectividad Bluetooth', 75.50, 20, 3),
-- Oficina (id_categoria = 4)
('Impresora multifuncional', 'Impresora, escáner y copiadora 3 en 1', 95.50, 20, 4),
('Escritorio ajustable', 'Escritorio ajustable en altura', 299.99, 10, 4),
-- Almacenamiento (id_categoria = 5)
('Disco duro externo', 'Disco duro externo de 1TB', 59.99, 40, 5),
('Unidad USB', 'Unidad flash USB de 64GB', 15.50, 150, 5),
-- Muebles (id_categoria = 6)
('Silla ergonómica', 'Silla ergonómica para oficina', 210.00, 5, 6),
('Mesa de conferencias', 'Mesa de conferencias de madera', 499.99, 2, 6),
-- Iluminación (id_categoria = 7)
('Lámpara de escritorio', 'Lámpara de escritorio con luz LED ajustable', 35.00, 25, 7),
('Tira LED', 'Tira LED de 5 metros con control remoto', 45.99, 30, 7),
-- Ropa (id_categoria = 8)
('Camiseta deportiva', 'Camiseta de poliéster para entrenamiento', 25.50, 100, 8),
('Sudadera con capucha', 'Sudadera con capucha para invierno', 45.00, 50, 8),
-- Deportes (id_categoria = 9)
('Pelota de fútbol', 'Pelota de fútbol tamaño estándar', 30.00, 60, 9),
-- Juguetes (id_categoria = 10)
('Muñeco de acción', 'Muñeco de acción con accesorios', 15.99, 80, 10);


-- Borramos todos los datos de proveedores
DELETE FROM proveedores;  -- Elimina todos los registros de la tabla

ALTER TABLE proveedores AUTO_INCREMENT = 1;  -- Resetea el valor de AUTO_INCREMENT a 1

-- Cargamos nuevos datos en la tabla proveedores
INSERT INTO proveedores (nombre, mail, telefono, cuit) VALUES
('Tech Distribuciones', 'contacto@techdistribuciones.com', 123456789, 30697866511),
('Electronica Global', 'ventas@electronicaglobal.com', 987654321, 20128969093),
('Soluciones de Oficina', 'info@solucionesdeoficina.com', 456123789, 20124567093),
('Almacenamientos XYZ', 'soporte@almacenamientosxyz.com', 741852963, 2789529093),
('ErgoMuebles', 'ventas@ergomuebles.com', 369258147, 20121234593),
('Iluminaciones LED', 'contacto@iluminacionesled.com', 852369741, 11123129093),
('Deportes Total', 'ventas@deportestotal.com', 963852741, 20123189093);

-- Borramos todos los datos de operaciones
DELETE FROM productos_proveedores;  -- Elimina todos los registros de la tabla

ALTER TABLE productos_proveedores AUTO_INCREMENT = 1;  -- Resetea el valor de AUTO_INCREMENT a 1

-- Insertar datos en la tabla productos_proveedores
INSERT INTO productos_proveedores (id_producto, id_proveedor) VALUES
-- Tech Distribuciones (id_proveedor = 1)
(1, 1),  -- Laptop
(3, 1),  -- Teclado mecánico
(6, 1),  -- Monitor 24 pulgadas
(10, 1), -- Tablet
(12, 1), -- Unidad USB
(13, 1), -- Escritorio ajustable
-- Electronica Global (id_proveedor = 2)
(2, 2),  -- Teléfono móvil
(4, 2),  -- Mouse inalámbrico
(11, 2), -- Cargador rápido
(14, 2), -- Lámpara de escritorio
-- Soluciones de Oficina (id_proveedor = 3)
(5, 3),  -- Auriculares
(15, 3), -- Altavoz Bluetooth
(19, 3), -- Camiseta deportiva
-- Almacenamientos XYZ (id_proveedor = 4)
(7, 4),  -- Impresora multifuncional
(8, 4),  -- Disco duro externo
(16, 4), -- Tira LED
(18, 4), -- Sudadera con capucha
-- ErgoMuebles (id_proveedor = 5)
(9, 5),  -- Silla ergonómica
(17, 5), -- Mesa de conferencias
-- Iluminaciones LED (id_proveedor = 6)
(14, 6), -- Lámpara de escritorio
(16, 6), -- Tira LED
-- Deportes Total (id_proveedor = 7)
(19, 7), -- Camiseta deportiva
(20, 7); -- Pelota de fútbol


-- Borramos todos los datos de operaciones
DELETE FROM operaciones;  -- Elimina todos los registros de la tabla

ALTER TABLE operaciones AUTO_INCREMENT = 1;  -- Resetea el valor de AUTO_INCREMENT a 1

-- Insertar datos en la tabla operaciones
INSERT INTO operaciones (id_producto, id_proveedor, id_tipo_operaciones, detalle, cantidad, fecha, hora) VALUES
-- Operaciones iniciales (las 10 que ya tenías)
(1, 1, 1, 'Compra de 10 laptops para stock inicial', 10, '2024-01-15', '09:30:00'),
(2, 2, 1, 'Compra de 25 teléfonos móviles Android', 25, '2024-02-10', '10:15:00'),
(3, 1, 1, 'Compra de 15 teclados mecánicos', 15, '2024-03-05', '14:00:00'),
(4, 2, 1, 'Compra de 50 mouse inalámbricos para promoción', 50, '2024-04-12', '11:45:00'),
(5, 3, 1, 'Compra de 30 auriculares con cancelación de ruido', 30, '2024-05-20', '16:20:00'),
(6, 4, 2, 'Devolución de 2 monitores defectuosos', 2, '2024-06-01', '13:10:00'),
(7, 5, 1, 'Compra de 20 impresoras multifuncionales', 20, '2024-07-15', '15:50:00'),
(8, 4, 1, 'Compra de 40 discos duros externos de 1TB', 40, '2024-08-10', '12:30:00'),
(9, 5, 1, 'Compra de 5 sillas ergonómicas para oficina', 5, '2024-09-01', '09:00:00'),
(10, 1, 2, 'Devolución de 3 tablets con pantalla dañada', 3, '2024-09-25', '10:45:00'),
-- Compras
(11, 2, 1, 'Compra de 100 cargadores rápidos para stock', 100, '2024-10-01', '08:00:00'),
(12, 1, 1, 'Compra de 200 unidades USB para stock', 200, '2024-10-02', '09:15:00'),
(13, 3, 1, 'Compra de 10 escritorios ajustables para oficina', 10, '2024-10-03', '10:30:00'),
(14, 6, 1, 'Compra de 50 lámparas de escritorio LED', 50, '2024-10-04', '11:45:00'),
(15, 3, 1, 'Compra de 20 altavoces Bluetooth para promoción', 20, '2024-10-05', '12:50:00'),
(16, 6, 1, 'Compra de 30 tiras LED para stock', 30, '2024-10-06', '14:05:00'),
(17, 5, 1, 'Compra de 15 mesas de conferencias para oficina', 15, '2024-10-07', '15:10:00'),
(18, 4, 1, 'Compra de 100 sudaderas con capucha para stock', 100, '2024-10-08', '16:25:00'),
(19, 7, 1, 'Compra de 200 camisetas deportivas para stock', 200, '2024-10-09', '17:30:00'),
(20, 7, 1, 'Compra de 50 pelotas de fútbol para tienda', 50, '2024-10-10', '18:00:00'),
-- Ventas
(1, 1, 4, 'Venta de 2 laptops a cliente', 2, '2024-10-11', '09:00:00'),
(2, 2, 4, 'Venta de 5 teléfonos móviles a cliente', 5, '2024-10-12', '10:30:00'),
(3, 1, 4, 'Venta de 10 teclados mecánicos a cliente', 10, '2024-10-13', '11:45:00'),
(4, 2, 4, 'Venta de 20 mouse inalámbricos a cliente', 20, '2024-10-14', '12:50:00'),
(5, 3, 4, 'Venta de 15 auriculares a cliente', 15, '2024-10-15', '14:10:00'),
(6, 4, 4, 'Venta de 5 monitores a cliente', 5, '2024-10-16', '15:30:00'),
(7, 5, 4, 'Venta de 8 impresoras multifuncionales a cliente', 8, '2024-10-17', '16:45:00'),
(8, 4, 4, 'Venta de 20 discos duros externos a cliente', 20, '2024-10-18', '17:50:00'),
(9, 5, 4, 'Venta de 3 sillas ergonómicas a cliente', 3, '2024-10-19', '18:00:00'),
(10, 1, 4, 'Venta de 5 tablets a cliente', 5, '2024-10-20', '08:15:00'),
-- Ajustes positivos
(1, 1, 5, 'Ajuste positivo de laptops en inventario', 5, '2024-10-21', '09:30:00'),
(2, 2, 5, 'Ajuste positivo de teléfonos móviles en inventario', 10, '2024-10-22', '10:45:00'),
(3, 1, 5, 'Ajuste positivo de teclados mecánicos en inventario', 8, '2024-10-23', '12:00:00'),
(4, 2, 5, 'Ajuste positivo de mouse inalámbricos en inventario', 15, '2024-10-24', '13:15:00'),
-- Ajustes negativos
(5, 3, 6, 'Ajuste negativo de auriculares en inventario', 5, '2024-10-25', '14:30:00'),
(6, 4, 6, 'Ajuste negativo de monitores en inventario', 2, '2024-10-26', '15:45:00'),
(7, 5, 6, 'Ajuste negativo de impresoras multifuncionales en inventario', 3, '2024-10-27', '17:00:00'),
(8, 4, 6, 'Ajuste negativo de discos duros externos en inventario', 5, '2024-10-28', '18:15:00'),
-- Desechos
(9, 5, 7, 'Desecho de sillas ergonómicas defectuosas', 1, '2024-10-29', '08:30:00'),
(10, 1, 7, 'Desecho de tablets defectuosas', 2, '2024-10-30', '09:45:00'),
(11, 2, 7, 'Desecho de cargadores rápidos defectuosos', 3, '2024-10-31', '10:00:00'),
(12, 1, 7, 'Desecho de unidades USB defectuosas', 5, '2024-11-01', '11:15:00');


-- Insertar datos en la tabla ordenes_de_compra
INSERT INTO ordenes_de_compra (id_producto, id_proveedor, cantidad, fecha_pedido, fecha_recepcion, estado) VALUES
(1, 1, 10, '2024-01-10', '2024-01-15', 'completado'),
(2, 2, 25, '2024-02-05', '2024-02-10', 'completado'),
(3, 1, 15, '2024-02-15', '2024-02-20', 'completado'),
(4, 2, 50, '2024-03-01', NULL, 'pendiente'),
(5, 3, 30, '2024-03-10', '2024-03-15', 'completado'),
(6, 4, 40, '2024-04-05', '2024-04-10', 'completado'),
(7, 4, 20, '2024-04-15', '2024-04-20', 'completado'),
(8, 5, 10, '2024-05-01', NULL, 'pendiente'),
(9, 5, 5, '2024-05-10', '2024-05-15', 'completado'),
(10, 6, 100, '2024-05-20', '2024-05-25', 'completado'),
(11, 6, 200, '2024-06-01', NULL, 'pendiente'),
(12, 7, 50, '2024-06-10', '2024-06-15', 'completado'),
(13, 1, 30, '2024-06-20', '2024-06-25', 'completado'),
(14, 2, 15, '2024-07-05', NULL, 'pendiente'),
(15, 3, 10, '2024-07-10', '2024-07-15', 'completado'),
(16, 4, 8, '2024-07-20', '2024-07-25', 'completado'),
(17, 5, 100, '2024-08-01', NULL, 'pendiente'),
(18, 7, 150, '2024-08-10', '2024-08-15', 'completado'),
(19, 7, 75, '2024-08-20', '2024-08-25', 'completado'),
(20, 1, 120, '2024-09-01', NULL, 'pendiente'),
(1, 1, 5, '2024-09-05', '2024-09-10', 'completado'),  -- Laptop
(1, 1, 15, '2024-09-15', NULL, 'pendiente'),           -- Laptop
(2, 2, 10, '2024-09-20', '2024-09-25', 'completado'),  -- Teléfono móvil
(2, 2, 5, '2024-10-01', NULL, 'pendiente'),            -- Teléfono móvil
(3, 1, 20, '2024-10-05', '2024-10-10', 'completado'),  -- Monitor 24 pulgadas
(3, 1, 8, '2024-10-12', NULL, 'pendiente'),            -- Monitor 24 pulgadas
(4, 2, 50, '2024-10-15', '2024-10-20', 'completado'),  -- Tablet
(4, 2, 25, '2024-10-25', NULL, 'pendiente'),           -- Tablet
(5, 3, 10, '2024-11-01', '2024-11-05', 'completado'),  -- Teclado mecánico
(5, 3, 12, '2024-11-10', NULL, 'pendiente'),           -- Teclado mecánico
(6, 4, 50, '2024-11-15', '2024-11-20', 'completado'),  -- Mouse inalámbrico
(6, 4, 100, '2024-11-25', NULL, 'pendiente'),          -- Mouse inalámbrico
(7, 5, 8, '2024-11-30', '2024-12-05', 'completado'),   -- Cargador rápido
(7, 5, 25, '2024-12-10', NULL, 'pendiente'),           -- Cargador rápido
(8, 6, 20, '2024-12-15', '2024-12-20', 'completado'),  -- Funda para laptop
(8, 6, 30, '2024-12-22', NULL, 'pendiente'),           -- Funda para laptop
(9, 7, 15, '2024-12-25', '2025-01-05', 'completado'),  -- Auriculares
(9, 7, 40, '2025-01-10', NULL, 'pendiente'),           -- Auriculares
(10, 7, 12, '2025-01-15', '2025-01-20', 'completado'), -- Altavoz Bluetooth
(10, 7, 18, '2025-01-25', NULL, 'pendiente');          -- Altavoz Bluetooth
