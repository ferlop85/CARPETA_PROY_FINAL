def decorador_simple(func):
    def nueva_funcion(*args, **kwargs):
        print("Inicio de la función")
        resultado = func(*args, **kwargs)  # Ejecuta la función original
        print("Despues de la función")
        return resultado
    return nueva_funcion

@decorador_simple
def sumar(a, b):
    print(f"La suma es: {a + b}")

sumar(3, 5)

