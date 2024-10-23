DELIMITER //

CREATE PROCEDURE obtener_productos()
BEGIN 
    SELECT * FROM productos;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE obtener_movimientos_de_producto(IN id INT)
BEGIN 
    SELECT 
        productos.nombre AS nombre_de_productos,
        operaciones.fecha AS fecha,
        operaciones.hora AS hora,
        tipo_operaciones.nombre AS tipo_de_operaciones,
        tipo_operaciones.afectacion_inventario AS suma_resta, -- Usamos el nombre de la operación
        operaciones.cantidad AS cantidad_de_productos
    FROM productos
    JOIN operaciones ON productos.id = operaciones.id_producto
    JOIN tipo_operaciones ON operaciones.id_tipo_operaciones = tipo_operaciones.id -- Relación correcta
    WHERE productos.id = id;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sumar_movimientos_producto(IN id INT, OUT total INT)
BEGIN
    SELECT SUM(operaciones.cantidad)
    INTO total
    FROM productos
    JOIN operaciones
    ON productos.id = operaciones.id_producto
    WHERE productos.id = id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE registrar_producto(
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(150),
    IN p_precio FLOAT,
    IN p_cantidad INT,
    IN p_id_categoria INT,
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    -- Verifica si ya existe un producto con el mismo nombre
    IF EXISTS (SELECT 1 FROM productos WHERE nombre = p_nombre) THEN
        SET p_mensaje = 'Error: El producto ya existe';
    ELSE
        -- Inserta el nuevo producto
        INSERT INTO productos (nombre, descripcion, precio, cantidad, id_categoria)
        VALUES (p_nombre, p_descripcion, p_precio, p_cantidad, p_id_categoria);
        
        -- Establece un mensaje de éxito
        SET p_mensaje = CONCAT('Producto ', p_nombre, ' registrado correctamente.');
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE actualizar_producto(
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(150),
    IN p_precio FLOAT,
    IN p_cantidad INT,
    IN p_id_categoria INT,
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    -- Verifica si el producto existe
    IF EXISTS (SELECT 1 FROM productos WHERE id = p_id) THEN
        -- Actualiza la información del producto
        UPDATE productos
        SET 
            nombre = p_nombre,
            descripcion = p_descripcion,
            precio = p_precio,
            cantidad = p_cantidad,
            id_categoria = p_id_categoria
        WHERE id = p_id;
        
        -- Establece un mensaje de éxito
        SET p_mensaje = CONCAT('Producto ID ', p_id, ' actualizado correctamente.');
    ELSE
        -- Si el producto no existe, devuelve un mensaje de error
        SET p_mensaje = 'Error: El producto no existe.';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE eliminar_producto(
    IN p_id INT,
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    -- Verifica si el producto existe
    IF EXISTS (SELECT 1 FROM productos WHERE id = p_id) THEN
        -- Elimina el producto de la tabla 'productos'
        DELETE FROM productos WHERE id = p_id;
        
        -- Establece un mensaje de éxito
        SET p_mensaje = CONCAT('Producto ID ', p_id, ' eliminado correctamente.');
    ELSE
        -- Si el producto no existe, devuelve un mensaje de error
        SET p_mensaje = 'Error: El producto no existe.';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE crear_categoria(
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(150),
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    -- Verifica si ya existe una categoría con el mismo nombre
    IF EXISTS (SELECT 1 FROM categoria WHERE nombre = p_nombre) THEN
        -- Si la categoría ya existe, devuelve un mensaje de error
        SET p_mensaje = 'Error: La categoría ya existe.';
    ELSE
        -- Inserta la nueva categoría
        INSERT INTO categoria (nombre, descripcion)
        VALUES (p_nombre, p_descripcion);
        
        -- Devuelve un mensaje de éxito
        SET p_mensaje = CONCAT('Categoría ', p_nombre, ' creada correctamente.');
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE editar_categoria(
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(150),
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    -- Verifica si la categoría existe
    IF EXISTS (SELECT 1 FROM categoria WHERE id = p_id) THEN
        -- Actualiza la información de la categoría
        UPDATE categoria
        SET 
            nombre = p_nombre,
            descripcion = p_descripcion
        WHERE id = p_id;
        
        -- Establece un mensaje de éxito
        SET p_mensaje = CONCAT('Categoría ID ', p_id, ' actualizada correctamente.');
    ELSE
        -- Si la categoría no existe, devuelve un mensaje de error
        SET p_mensaje = 'Error: La categoría no existe.';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE eliminar_categoria(
    IN p_id INT,
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    -- Verifica si la categoría existe
    IF EXISTS (SELECT 1 FROM categoria WHERE id = p_id) THEN
        -- Elimina la categoría
        DELETE FROM categoria WHERE id = p_id;
        
        -- Establece un mensaje de éxito
        SET p_mensaje = CONCAT('Categoría ID ', p_id, ' eliminada correctamente.');
    ELSE
        -- Si la categoría no existe, devuelve un mensaje de error
        SET p_mensaje = 'Error: La categoría no existe.';
    END IF;
END //

DELIMITER ;



