/* CREAR USUARIO */

CREATE USER 'usuario_proyecto_final'@'localhost' IDENTIFIED BY 'clave123';

/* Conceder provilegios */

GRANT ALL PRIVILEGES ON bd_inventarios.* TO  'usuario_proyecto_final'@'localhost';

