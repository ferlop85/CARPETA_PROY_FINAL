from flask import Flask
from flask import jsonify
from flask import request
from api.db.test_db import productos

#crear una instancia de Flask
app = Flask(__name__)

@app.route('/test')
def test():
    return jsonify({"mesagge" : "test ok"})

'''producto1 = {
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


@app.route('/usuario/<nombre>')
def usuario(nombre):
    return jsonify({"Su nombre es" : nombre})

@app.route('/producto/<int:id>', methods = ["GET"])
def get_producto_by_id(id):
    return jsonify({
                    'id' : id,
                    'nombre': 'Televisor LED', #str
                    'descripcion': 'Televisor de 55 pulgadas con resolución 4K.',#str
                    'categoria': 'Electrónica',#str
                    'precio': 45000,#float
                    'stock': 10 #int
                    })


@app.route('/test/<path:nombre>')
def no_hacer(nombre):
    return nombre


if __name__ == '__main__' :
    app.run( debug = True, port = 5000)