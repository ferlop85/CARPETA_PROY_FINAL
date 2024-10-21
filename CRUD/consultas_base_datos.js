//servicio para  Gestión de Productos: 
//El sistema debe permitir registrar nuevos productos con información como: nombre, descripción, precio, cantidad en stock, categoría. 
//- Debe permitir la actualización de información del producto (nombre, descripción, precio, etc.). 
//- Debe permitir eliminar productos del inventario. 

//caract del producto
/*productos = [
    {
        id: 1, //int
        nombre: 'Televisor LED', //str
        descripcion: 'Televisor de 55 pulgadas con resolución 4K.',//str
        categoria: 'Electrónica',//str
        precio: 45000,//float
        stock: 10 //int
    }]
*/

//URL BASE DE LA API //
//********************
// en este caso es la prueba con mook api, 
//despues hay que cambiarla por donde queremos que apunte
const API_URL = 'https://66f599b6436827ced9748710.mockapi.io/v1';


function handleResponse(response){
    if (!response.ok){
        return Promise.reject({
            message : 'Codigo HTTP: ' + response.status  +' ' +response.statusText 
        })
    }
    else{
        return response.json()
    }
}

function mostrarProductos(data){
    console.log(data);
}

function processError(error){
    //alerta
    console.log('Se produjo un error', error)
}

function requestFinished(){
    console.log('Finalizo la solicitud')
}

function getAllProductos(){
    //GET Productos
    const requestOptions = {
        method : 'GET',
        headers : {
            'Accept' : 'application/json',
            'User-Agent' : 'Soy Jacqui'
        }
    };
    console.log('Iniciando solicitud: Obtener todos los productos');

    fetch(API_URL + '/persons', requestOptions)
        .then( response => handleResponse(response) ) //aca se recibe la respuesta del servidor
        .then( data => mostrarProductos(data))
        .catch( error => processError(error) )
        .finally( () => requestFinished())

    
}

//getAllProductos();


function newProductoCreado(producto_creado){
    console.log('Se ha crado un nuevo porducto: ', producto_creado)
}

function postProducto(){
    //POST Productos
    //Crear un nuevo producto
    const new_producto = 
        {
            nombre: 'Televisor LED', //str
            descripcion: 'Televisor de 55 pulgadas con resolución 4K.',//str
            categoria: 'Electrónica',//str
            precio: 45000,//float
            stock: 10 //int
        }
        
    const requestOptions = {
        method : 'POST',
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json',
            'User-Agent' : 'Soy Jacqui'
        },
        body: JSON.stringify(new_producto)//aca lo convierte en texto plano 
    };
    console.log('Iniciando solicitud: Creando un Producto nuevo ');

    fetch(API_URL + '/persons', requestOptions)
        .then( response => handleResponse(response) ) //aca se recibe la respuesta del servidor
        .then( data => newProductoCreado(data))
        .catch( error => processError(error) )
        .finally( () => requestFinished())

    
}

//postProducto()

function mostrarUnProducto(producto){
    console.log('Los datos del producto consultado son: ', producto)
}

function getProductoById(id){
    //GET un Producto en particular
    const requestOptions = {
        method : 'GET',
        headers : {
            'Accept' : 'application/json',
            'User-Agent' : 'Soy Jacqui'
        }
    };
    console.log('Iniciando solicitud: Obtener un producto en particular:', id);

    fetch(API_URL + '/persons/' + id, requestOptions)
        .then( response => handleResponse(response) ) //aca se recibe la respuesta del servidor
        .then( data => mostrarUnProducto(data))
        .catch( error => processError(error) )
        .finally( () => requestFinished())

    
}

//getProductoById(9);
//getProductoById(10);
//getProductoById(30);

function ProductoEditado(producto_Modificado){
    console.log('Se ha modificado el producto:', producto_Modificado)
}

function putProducto(id){
    //PUT Producto
    //Modificar un producto
    const productoModificado = 
        {
            nombre: 'Televisor LED', //str
            descripcion: 'Televisor de 55 pulgadas con resolución 4K.',//str
            categoria: 'Electrónica',//str
            precio: 45,//float
            stock: 10000 //int
        }
        
    const requestOptions = {
        method : 'PUT',
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json',
            'User-Agent' : 'Soy Jacqui'
        },
        body: JSON.stringify(productoModificado)//aca lo convierte en texto plano 
    };
    console.log('Iniciando solicitud: Editando un Producto:  ', id);

    fetch(API_URL + '/persons/' + id, requestOptions)
        .then( response => handleResponse(response) ) //aca se recibe la respuesta del servidor
        .then( data => ProductoEditado(data))
        .catch( error => processError(error) )
        .finally( () => requestFinished())

    
}
//getProductoById(2)
//putProducto(3);

function deleteUnProducto(producto){
    console.log('Se ha eliminado el producto:', producto)
}


function deleteProductoById(id){
    //DELETE un Producto en particular
    const requestOptions = {
        method : 'DELETE',
        headers : {
            'Accept' : 'application/json',
            'User-Agent' : 'Soy Jacqui'
        }
    };
    console.log('Iniciando solicitud: ELIMINANDO un producto en particular:', id);

    fetch(API_URL + '/persons/' + id, requestOptions)
        .then( response => handleResponse(response) ) //aca se recibe la respuesta del servidor
        .then( data => deleteUnProducto(data))
        .catch( error => processError(error) )
        .finally( () => requestFinished())

    
}

//deleteProductoById(3)
getProductoById(3)