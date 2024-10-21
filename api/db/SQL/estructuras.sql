CREATE DATABASE IF NOT EXISTS bd_inventarios 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE bd_inventarios;

CREATE TABLE IF NOT EXISTS proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cuit BIGINT NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    mail VARCHAR(150) NOT NULL,
    telefono INT NOT NULL
);


CREATE TABLE IF NOT EXISTS categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL,
    precio FLOAT NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT NULL,
    CONSTRAINT fk_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES categoria(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS tipo_operaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(150),
    afectacion_inventario ENUM('suma', 'resta') NOT NULL -- Indica si la operación suma o resta
);


CREATE TABLE IF NOT EXISTS operaciones (
    id INT AUTO_INCREMENT PRIMARY KEY, -- La clave primaria debe ser 'id', que identifica a cada operación
    id_producto INT NULL,
    id_proveedor INT NULL,
    id_tipo_operaciones INT NULL, -- Relacionado con la tabla 'tipo_operaciones'
    detalle VARCHAR(150),
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT operacion_de_producto
    FOREIGN KEY (id_producto)
    REFERENCES productos(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT operacion_de_proveedor
    FOREIGN KEY (id_proveedor)
    REFERENCES proveedores(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT fk_tipo_operacion
    FOREIGN KEY (id_tipo_operaciones) -- Relación correcta con 'tipo_operaciones'
    REFERENCES tipo_operaciones(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS productos_proveedores (
    id_producto INT,
    id_proveedor INT,
    PRIMARY KEY (id_producto, id_proveedor),
    CONSTRAINT fk_producto
    FOREIGN KEY (id_producto)
    REFERENCES productos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_proveedor
    FOREIGN KEY (id_proveedor)
    REFERENCES proveedores(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ordenes_de_compra (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Clave primaria auto incremental
    id_producto INT NULL, -- Clave foránea hacia la tabla 'productos'
    id_proveedor INT NULL, -- Clave foránea hacia la tabla 'proveedores'
    cantidad INT NOT NULL, -- Cantidad de productos
    fecha_pedido DATE NOT NULL, -- Fecha en la que se realiza el pedido
    fecha_recepcion DATE NULL, -- Fecha de recepción, permite valores nulos
    estado ENUM('pendiente', 'completado') NOT NULL, -- Estado de la orden
    CONSTRAINT fk_producto_orden
        FOREIGN KEY (id_producto)
        REFERENCES productos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_proveedor_orden
        FOREIGN KEY (id_proveedor)
        REFERENCES proveedores(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
