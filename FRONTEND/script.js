//              PAGINA INICIAL

// script.js
function mostrarSeccion(seccion) {
    // Mostrar qué sección está intentando mostrar
    console.log("Sección seleccionada: ", seccion);

    // Ocultar todas las secciones
    const secciones = document.querySelectorAll('main section');
    secciones.forEach(function(sec) {
        console.log("Ocultando sección: ", sec.id);
        sec.classList.add('oculto');
    });

    // Mostrar la sección seleccionada
    const seccionSeleccionada = document.getElementById(seccion);
    if (seccionSeleccionada) {
        console.log("Mostrando sección: ", seccionSeleccionada.id);
        seccionSeleccionada.classList.remove('oculto');
    } else {
        console.log("No se encontró la sección con ID: ", seccion);
    }
}


//              GESTION DE PRODUCTOS

let productos = [
    {
        id: 1,
        nombre: 'Televisor LED',
        descripcion: 'Televisor de 55 pulgadas con resolución 4K.',
        categoria: 'Electrónica',
        precio: 45000,
        stock: 10
    },
    {
        id: 2,
        nombre: 'Sillón de Cuero',
        descripcion: 'Sillón reclinable de cuero sintético.',
        categoria: 'Muebles',
        precio: 32000,
        stock: 5
    },
    {
        id: 3,
        nombre: 'Camiseta Deportiva',
        descripcion: 'Camiseta de material transpirable para deportes.',
        categoria: 'Ropa',
        precio: 1500,
        stock: 50
    },
    {
        id: 4,
        nombre: 'Laptop Gamer',
        descripcion: 'Laptop con procesador Intel i7 y 16GB de RAM.',
        categoria: 'Electrónica',
        precio: 125000,
        stock: 7
    },
    {
        id: 5,
        nombre: 'Set de Bloques de Construcción',
        descripcion: 'Juguete educativo con 500 piezas de construcción.',
        categoria: 'Juguetes',
        precio: 2800,
        stock: 30
    }
];

function agregarOActualizarProducto(event) {
    event.preventDefault();

    const nombre = document.getElementById('producto-nombre').value;
    const descripcion = document.getElementById('producto-descripcion').value;
    const categoria = document.getElementById('producto-categoria').value;
    const precio = document.getElementById('producto-precio').value;
    const stock = document.getElementById('producto-stock').value;
    const productoIndex = document.getElementById('producto-index').value;

    const producto = { nombre, descripcion, categoria, precio, stock };

    if (productoIndex === "") {
        // Agregar nuevo producto
        productos.push(producto);
    } else {
        // Actualizar producto existente
        productos[productoIndex] = producto;
    }

    mostrarProductos();

    // Limpiar el formulario
    document.getElementById('form-producto').reset();
    document.getElementById('producto-index').value = "";
}

function mostrarProductos() {
    const listaProductos = document.getElementById('lista-productos');
    listaProductos.innerHTML = ''; // Limpiar la tabla antes de mostrar los productos

    productos.forEach((producto, index) => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${producto.nombre}</td>
            <td>${producto.descripcion}</td>
            <td>${producto.categoria}</td>
            <td>${producto.precio}</td>
            <td>${producto.stock}</td>
            <td>
                <button onclick="editarProducto(${index})">Editar</button>
                <button onclick="eliminarProducto(${index})">Eliminar</button>
                <button onclick="relacionarProveedores(${producto.id})">Relacionar Proveedores</button>
            </td>
        `;

        listaProductos.appendChild(fila);
    });
}


function editarProducto(index) {
    const producto = productos[index];
    
    document.getElementById('producto-nombre').value = producto.nombre;
    document.getElementById('producto-descripcion').value = producto.descripcion;
    document.getElementById('producto-categoria').value = producto.categoria;
    document.getElementById('producto-precio').value = producto.precio;
    document.getElementById('producto-stock').value = producto.stock;
    document.getElementById('producto-index').value = index;
}

function eliminarProducto(index) {
    productos.splice(index, 1);
    mostrarProductos();
}

// Función para cargar las categorías en el select de productos desde el array "categorias"
function cargarCategorias() {
    const selectCategoria = document.getElementById('producto-categoria');

    // Limpiar el select antes de agregar opciones
    selectCategoria.innerHTML = '';

    // Agregar cada categoría del array "categorias" como una opción
    categorias.forEach(categoria => {
        const option = document.createElement('option');
        option.value = categoria.nombre; // Usamos el nombre como valor
        option.textContent = categoria.nombre;
        selectCategoria.appendChild(option);
    });
}

//                  SECCION DE CATEGORIAS

// Categorías para la gestión de categorías
let categorias = [
    {
        id: 'C001',
        nombre: 'Electrónica',
        descripcion: 'Dispositivos electrónicos y gadgets.'
    },
    {
        id: 'C002',
        nombre: 'Ropa',
        descripcion: 'Vestimenta de diferentes tipos.'
    },
    {
        id: 'C003',
        nombre: 'Juguetes',
        descripcion: 'Artículos de entretenimiento para niños.'
    }
];

// Funciones para la gestión de categorías (agregar, mostrar, editar, eliminar)
function agregarOActualizarCategoria(event) {
    event.preventDefault();

    const id = document.getElementById('id-categoria').value;
    const nombre = document.getElementById('nombre-categoria').value;
    const descripcion = document.getElementById('descripcion-categoria').value;
    const categoriaIndex = document.getElementById('categoria-index').value;

    const categoria = { id, nombre, descripcion };

    if (categoriaIndex === "") {
        // Agregar nueva categoría
        categorias.push(categoria);
    } else {
        // Actualizar categoría existente
        categorias[categoriaIndex] = categoria;
    }

    mostrarCategorias();
    cargarCategorias();  // Actualizamos el select de productos cuando se actualizan las categorías

    // Limpiar el formulario
    document.getElementById('form-categoria').reset();
    document.getElementById('categoria-index').value = "";
}

function mostrarCategorias() {
    const listaCategorias = document.getElementById('lista-categorias');
    listaCategorias.innerHTML = '';

    categorias.forEach((categoria, index) => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${categoria.id}</td>
            <td>${categoria.nombre}</td>
            <td>${categoria.descripcion}</td>
            <td>
                <button onclick="editarCategoria(${index})">Editar</button>
                <button onclick="eliminarCategoria(${index})">Eliminar</button>
            </td>
        `;

        listaCategorias.appendChild(fila);
    });
}

function editarCategoria(index) {
    const categoria = categorias[index];
    
    document.getElementById('id-categoria').value = categoria.id;
    document.getElementById('nombre-categoria').value = categoria.nombre;
    document.getElementById('descripcion-categoria').value = categoria.descripcion;
    document.getElementById('categoria-index').value = index;
}

function eliminarCategoria(index) {
    categorias.splice(index, 1);
    mostrarCategorias();
    cargarCategorias();  // Actualizamos el select de productos cuando se eliminan categorías
}

//                  GESTION DE STOCK

// Nivel crítico de stock (harcodeado por ahora, pero editable)
let nivelCritico = 5;  // Este número representa el stock crítico inicial

// Función para actualizar el nivel crítico cuando se edita
function actualizarStockCritico() {
    nivelCritico = parseInt(document.getElementById('nivel-critico').value);
    mostrarProductosConStockCritico();
}

// Función para mostrar los productos con stock crítico
function mostrarProductosConStockCritico() {
    const tablaStockCritico = document.getElementById('tabla-stock-critico');
    tablaStockCritico.innerHTML = ''; // Limpiar la tabla

    // Filtrar productos con stock menor o igual al nivel crítico
    const productosCriticos = productos.filter(producto => producto.stock <= nivelCritico);

    // Mostrar los productos con stock crítico
    productosCriticos.forEach(producto => {
        const fila = document.createElement('tr');
        
        fila.innerHTML = `
            <td>${producto.nombre}</td>
            <td>${producto.descripcion}</td>
            <td>${producto.categoria}</td>
            <td>${producto.stock}</td>
        `;
        
        tablaStockCritico.appendChild(fila);
    });
}

//                  GESTION DE PROVEEDORES

// Proveedores registrados (con carga inicial)
let proveedores = [
    {
        id: 1,
        nombre: 'Proveedor A',
        cuit: '20-12345678-9',
        direccion: 'Calle Falsa 123',
        mail: 'proveedora@example.com',
        telefono: '123456789'
    },
    {
        id: 2,
        nombre: 'Proveedor B',
        cuit: '30-87654321-0',
        direccion: 'Avenida Siempreviva 742',
        mail: 'proveedorb@example.com',
        telefono: '987654321'
    },
    {
        id: 3,
        nombre: 'Proveedor C',
        cuit: '27-09876543-2',
        direccion: 'Calle del Sol 456',
        mail: 'proveedorc@example.com',
        telefono: '654321987'
    }
];

// Función para agregar o actualizar un proveedor
function agregarOActualizarProveedor(event) {
    event.preventDefault();

    const nombre = document.getElementById('nombre-proveedor').value;
    const cuit = document.getElementById('cuit-proveedor').value;
    const direccion = document.getElementById('direccion-proveedor').value;
    const mail = document.getElementById('mail-proveedor').value;
    const telefono = document.getElementById('telefono-proveedor').value;
    const proveedorIndex = document.getElementById('proveedor-index').value;

    const proveedor = { nombre, cuit, direccion, mail, telefono };

    if (proveedorIndex === "") {
        // Agregar nuevo proveedor
        proveedores.push(proveedor);
    } else {
        // Actualizar proveedor existente
        proveedores[proveedorIndex] = proveedor;
    }

    mostrarProveedores();

    // Limpiar el formulario
    document.getElementById('form-proveedor').reset();
    document.getElementById('proveedor-index').value = "";
}

function mostrarProveedores() {
    const listaProveedores = document.getElementById('lista-proveedores');
    listaProveedores.innerHTML = ''; // Limpiar la tabla antes de mostrar los proveedores

    proveedores.forEach((proveedor, index) => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${proveedor.nombre}</td>
            <td>${proveedor.cuit}</td>
            <td>${proveedor.direccion}</td>
            <td>${proveedor.mail}</td>
            <td>${proveedor.telefono}</td>
            <td>
                <button onclick="editarProveedor(${index})">Editar</button>
                <button onclick="eliminarProveedor(${index})">Eliminar</button>
                <button onclick="relacionarProductos(${proveedor.id})">Relacionar Productos</button>
            </td>
        `;

        listaProveedores.appendChild(fila);
    });
}


function editarProveedor(index) {
    const proveedor = proveedores[index];

    document.getElementById('nombre-proveedor').value = proveedor.nombre;
    document.getElementById('cuit-proveedor').value = proveedor.cuit;
    document.getElementById('direccion-proveedor').value = proveedor.direccion;
    document.getElementById('mail-proveedor').value = proveedor.mail;
    document.getElementById('telefono-proveedor').value = proveedor.telefono;
    document.getElementById('proveedor-index').value = index;
}

function eliminarProveedor(index) {
    proveedores.splice(index, 1);
    mostrarProveedores();
}

//          SECCION RELACIONAR PROVEEDORES A UN PRODUCTO

// Relación intermedia: producto-proveedor
let productoProveedores = [
    { idProducto: 1, idProveedor: 1 },
    { idProducto: 2, idProveedor: 2 }
];

let productoSeleccionado = null; // Producto actualmente seleccionado

// Mostrar la sección "Relacionar productos a proveedores" con el producto seleccionado
function relacionarProveedores(idProducto) {
    productoSeleccionado = productos.find(p => p.id === idProducto);

    // Mostrar nombre y descripción del producto
    document.getElementById('nombre-producto-seleccionado').innerText = `Producto: ${productoSeleccionado.nombre}`;
    document.getElementById('descripcion-producto-seleccionado').innerText = `Descripción: ${productoSeleccionado.descripcion}`;

    // Mostrar proveedores relacionados
    mostrarProveedoresRelacionados(idProducto);

    // Cargar proveedores en el selector
    cargarProveedoresEnSelector();

    // Ocultar otras secciones y mostrar la sección de relación
    mostrarSeccion('relacionar-productos-proveedores');
}

function mostrarProveedoresRelacionados(idProducto) {
    const listaProveedoresRelacionados = document.getElementById('lista-proveedores-relacionados');
    listaProveedoresRelacionados.innerHTML = '';

    // Filtrar proveedores relacionados con este producto
    const proveedoresRelacionados = productoProveedores.filter(r => r.idProducto === idProducto)
        .map(r => proveedores.find(p => p.id === r.idProveedor));

    proveedoresRelacionados.forEach(proveedor => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${proveedor.nombre}</td>
            <td><button onclick="eliminarProveedorDelProducto(${proveedor.id})">Eliminar</button></td>
        `;

        listaProveedoresRelacionados.appendChild(fila);
    });
}

// Cargar los proveedores en el selector
function cargarProveedoresEnSelector() {
    const proveedorSelector = document.getElementById('proveedor-selector');
    proveedorSelector.innerHTML = '';

    proveedores.forEach(proveedor => {
        const option = document.createElement('option');
        option.value = proveedor.id;
        option.textContent = proveedor.nombre;
        proveedorSelector.appendChild(option);
    });
}

// Agregar un proveedor al producto seleccionado
function agregarProveedorAlProducto(event) {
    event.preventDefault();

    const idProveedor = parseInt(document.getElementById('proveedor-selector').value);

    // Verificar si ya está relacionado
    if (!productoProveedores.some(r => r.idProducto === productoSeleccionado.id && r.idProveedor === idProveedor)) {
        productoProveedores.push({ idProducto: productoSeleccionado.id, idProveedor });
        mostrarProveedoresRelacionados(productoSeleccionado.id);
    }
}

// Eliminar proveedor de producto
function eliminarProveedorDelProducto(idProveedor) {
    productoProveedores = productoProveedores.filter(r => !(r.idProducto === productoSeleccionado.id && r.idProveedor === idProveedor));
    mostrarProveedoresRelacionados(productoSeleccionado.id);
}

//      SECCION RELACIONAR RPRODUCTOS A UN PROVEEDOR

let proveedorSeleccionado = null; // Proveedor actualmente seleccionado


// Mostrar la sección "Relacionar proveedores a productos" con el proveedor seleccionado
function relacionarProductos(idProveedor) {
    proveedorSeleccionado = proveedores.find(p => p.id === idProveedor);

    // Mostrar nombre, CUIT y teléfono del proveedor
    document.getElementById('nombre-proveedor-seleccionado').innerText = `Proveedor: ${proveedorSeleccionado.nombre}`;
    document.getElementById('cuit-proveedor-seleccionado').innerText = `CUIT: ${proveedorSeleccionado.cuit}`;
    document.getElementById('telefono-proveedor-seleccionado').innerText = `Teléfono: ${proveedorSeleccionado.telefono}`;

    // Mostrar productos relacionados
    mostrarProductosRelacionados(idProveedor);

    // Cargar productos en el selector
    cargarProductosEnSelector();

    // Ocultar otras secciones y mostrar la sección de relación
    mostrarSeccion('relacionar-proveedores-productos');
}

function mostrarProductosRelacionados(idProveedor) {
    const listaProductosRelacionados = document.getElementById('lista-productos-relacionados');
    listaProductosRelacionados.innerHTML = '';

    // Filtrar productos relacionados con este proveedor
    const productosRelacionados = productoProveedores.filter(r => r.idProveedor === idProveedor)
        .map(r => productos.find(p => p.id === r.idProducto));

    productosRelacionados.forEach(producto => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${producto.nombre}</td>
            <td><button onclick="eliminarProductoDelProveedor(${producto.id})">Eliminar</button></td>
        `;

        listaProductosRelacionados.appendChild(fila);
    });
}

// Cargar los productos en el selector
function cargarProductosEnSelector() {
    const productoSelector = document.getElementById('producto-selector');
    productoSelector.innerHTML = '';

    productos.forEach(producto => {
        const option = document.createElement('option');
        option.value = producto.id;
        option.textContent = producto.nombre;
        productoSelector.appendChild(option);
    });
}

// Agregar un producto al proveedor seleccionado
function agregarProductoAlProveedor(event) {
    event.preventDefault();

    const idProducto = parseInt(document.getElementById('producto-selector').value);

    // Verificar si ya está relacionado
    if (!productoProveedores.some(r => r.idProveedor === proveedorSeleccionado.id && r.idProducto === idProducto)) {
        productoProveedores.push({ idProveedor: proveedorSeleccionado.id, idProducto });
        mostrarProductosRelacionados(proveedorSeleccionado.id);
    }
}

// Eliminar producto de proveedor
function eliminarProductoDelProveedor(idProducto) {
    productoProveedores = productoProveedores.filter(r => !(r.idProveedor === proveedorSeleccionado.id && r.idProducto === idProducto));
    mostrarProductosRelacionados(proveedorSeleccionado.id);
}

//          SECCION DE GESTION DE ORDENES

let ordenes = [
    {
        producto: 'Televisor LED',
        proveedor: 'Proveedor A',
        cantidad: 10,
        fechaPedido: '2024-10-01',
        fechaRecepcion: '2024-10-05',
        estado: 'Completado'
    },
    {
        producto: 'Sillón de Cuero',
        proveedor: 'Proveedor B',
        cantidad: 5,
        fechaPedido: '2024-09-20',
        fechaRecepcion: '2024-09-25',
        estado: 'Completado'
    },
    {
        producto: 'Camiseta Deportiva',
        proveedor: 'Proveedor C',
        cantidad: 50,
        fechaPedido: '2024-10-02',
        fechaRecepcion: 'Pendiente',
        estado: 'Pendiente'
    }
];

// Función para cargar productos en el selector
function cargarProductosEnOrden() {
    const productoSelector = document.getElementById('producto-orden');
    productoSelector.innerHTML = '';

    productos.forEach(producto => {
        const option = document.createElement('option');
        option.value = producto.id;
        option.textContent = producto.nombre;
        productoSelector.appendChild(option);
    });
    cargarProveedoresEnOrden()
}

// Función para cargar proveedores en el selector según el producto seleccionado
function cargarProveedoresEnOrden() {
    const productoId = document.getElementById('producto-orden').value; // Obtener el producto seleccionado
    const proveedorSelector = document.getElementById('proveedor-orden');
    proveedorSelector.innerHTML = '';

    // Filtrar los proveedores relacionados con el producto seleccionado
    const proveedoresRelacionados = productoProveedores
        .filter(relacion => relacion.idProducto == productoId)
        .map(relacion => proveedores.find(proveedor => proveedor.id == relacion.idProveedor));

    // Agregar los proveedores relacionados al selector
    proveedoresRelacionados.forEach(proveedor => {
        const option = document.createElement('option');
        option.value = proveedor.id;
        option.textContent = proveedor.nombre;
        proveedorSelector.appendChild(option);
    });
}

// Función para cargar los proveedores solo cuando se cambia el producto
document.getElementById('producto-orden').addEventListener('change', cargarProveedoresEnOrden);

// Función para agregar o actualizar una orden de compra
function agregarOActualizarOrden(event) {
    event.preventDefault();

    const productoId = document.getElementById('producto-orden').value;
    const proveedorId = document.getElementById('proveedor-orden').value;
    const cantidad = document.getElementById('cantidad-solicitada').value;
    const fechaPedido = document.getElementById('fecha-pedido').value;
    const fechaRecepcion = document.getElementById('fecha-recepcion').value || 'Pendiente';
    const estado = document.getElementById('estado-orden').value;

    const producto = productos.find(p => p.id == productoId).nombre;
    const proveedor = proveedores.find(p => p.id == proveedorId).nombre;

    const nuevaOrden = { producto, proveedor, cantidad, fechaPedido, fechaRecepcion, estado };

    if (ordenEditadaIndex !== null) {
        // Actualizar la orden existente
        ordenes[ordenEditadaIndex] = nuevaOrden;
        ordenEditadaIndex = null; // Resetear el índice de edición
    } else {
        // Agregar nueva orden
        ordenes.push(nuevaOrden);
    }

    mostrarOrdenes();

    // Limpiar el formulario
    document.getElementById('form-orden').reset();
    document.getElementById('producto-orden').value = ''; // Asegurarse de limpiar el selector de productos
    document.getElementById('proveedor-orden').value = ''; // Asegurarse de limpiar el selector de proveedores
    ordenEditadaIndex = null; // Asegurarse de restablecer el índice de edición
}

// Función para mostrar las órdenes de compra
function mostrarOrdenes() {
    const listaOrdenes = document.getElementById('lista-ordenes');
    listaOrdenes.innerHTML = ''; // Limpiar la tabla antes de mostrar las órdenes

    ordenes.forEach((orden, index) => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${orden.producto}</td>
            <td>${orden.proveedor}</td>
            <td>${orden.cantidad}</td>
            <td>${orden.fechaPedido}</td>
            <td>${orden.fechaRecepcion}</td>
            <td>${orden.estado}</td>
            <td>
                <button onclick="editarOrden(${index})">Editar</button>
                <button onclick="eliminarOrden(${index})">Eliminar</button>
            </td>
        `;

        listaOrdenes.appendChild(fila);
    });
}

// Función para eliminar una orden de compra
function eliminarOrden(index) {
    ordenes.splice(index, 1);
    mostrarOrdenes();
}

// Función para editar una orden de compra
function editarOrden(index) {
    const orden = ordenes[index];

    // Cargar los datos en el formulario
    document.getElementById('producto-orden').value = productos.find(p => p.nombre === orden.producto).id;
    document.getElementById('proveedor-orden').value = proveedores.find(p => p.nombre === orden.proveedor).id;
    document.getElementById('cantidad-solicitada').value = orden.cantidad;
    document.getElementById('fecha-pedido').value = orden.fechaPedido;
    document.getElementById('fecha-recepcion').value = orden.fechaRecepcion === 'Pendiente' ? '' : orden.fechaRecepcion;
    document.getElementById('estado-orden').value = orden.estado;

    // Establecer el índice de la orden que estamos editando
    ordenEditadaIndex = index;
    
    cargarProveedoresEnOrden();
}

function cancelarEdicion() {
    document.getElementById('form-orden').reset();
    document.getElementById('producto-orden').value = ''; // Resetear selector de productos
    document.getElementById('proveedor-orden').value = ''; // Resetear selector de proveedores
    ordenEditadaIndex = null; // Restablecer el índice de edición
}


// CARGA DE LA PAGINA

// Llamar la función cuando la página cargue
window.onload = function() {
    cargarProductosEnOrden();
    cargarProveedoresEnOrden();
    mostrarOrdenes();
    cargarCategorias();
    mostrarProductos();
    mostrarCategorias();
    mostrarProductosConStockCritico();  // Mostrar productos con stock crítico en la tabla
    mostrarProveedores(); // Mostrar proveedores al cargar la página
};


