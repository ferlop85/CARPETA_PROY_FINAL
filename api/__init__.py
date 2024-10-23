from flask import Flask
from flask import jsonify
from flask import request
from api.db.test_db import productos_db

#crear una instancia de Flask
app = Flask(__name__)

'''
@app.route('/test')
def test():
    return jsonify({"mesagge" : "test ok"})

producto1 = {
    'id' : 1,
    'nombre': 'Televisor LED', #str
    'descripcion': 'Televisor de 55 pulgadas con resolución 4K.',#str
    'categoria': 'Electrónica',#str
    'precio': 45000,#float
    'stock': 10 #int
}'''


#Definir rutas
@app.route('/')
def index():
    return jsonify({"message" : "ruta index"})

@app.route('/test')
def nueva_prueba():
    return jsonify({"message" : "esto esta funcionando con la ruta test"})

@app.route('/productos', methods = ['GET'])#el Get se da por defecto
def get_all_products():
    #Aca iria la consulta a la base de datos SELECT * FROM tabla productos
    return jsonify({ "productos" : productos_db})


#Selecciona un producto por su id
@app.route('/productos/<int:id>', methods = ['GET'])#el Get se da por defecto
def get_one_product_by_id(id):
    #Aca iria la consulta a la base de datos SELECT * FROM tabla productos where id = id
    product = [product for product in productos_db if product["id"] == id]
    
    return jsonify({ "producto" : product[0]})


@app.route('/productos', methods = ['POST'])#el Get se da por defecto
def create_one_product():
    #Aca iria la consulta a la base de datos
    # simula INSERT INTO persons VALUES(id, nombre,descripcion, categoria,precio, stock)
    # Control de datos recibidos
    '''{
    "id": 1,
    "nombre": "Televisor LED",
    "descripcion": "Televisor de 55 pulgadas con resolución 4K.",
    "categoria": "Electrónica",
    "precio": 45000,
    "stock": 10
    },'''
    # Control de datos recibidos
    name = request.get_json()["nombre"]
    descripcion = request.get_json()["descripcion"]
    categoria = request.get_json()["categoria"]
    precio = request.get_json()["precio"]
    stock = request.get_json()["stock"]
    cod = request.get_json()["codigo"]


    # Control: no se permite codigo de articulo repetido
    existe = False
    for product in productos_db:
        if product["codigo"] == cod:
            existe = True


    if not existe:
    # simulamos id autoincremental en BD
        max_id = 0
        
        for product in productos_db:
            if product["id"] > max_id:
                max_id = product["id"]

        new_product = {
                    "nombre": name,
                    "descripcion": descripcion,
                    "categoria": categoria,
                    "precio": precio,
                    "stock": stock,
                    "id" :  max_id + 1,
                    "codigo": cod

                    }
        productos_db.append(new_product)



        return jsonify({ "product" : new_product}), 201
    
    else:
        return jsonify( {"message" : f"Error: ya existe ese articulo:  {cod}"}), 400



    
    
