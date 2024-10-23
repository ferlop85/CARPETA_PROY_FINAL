# Proyecto Flask

Repositorio de ejemplo para desarrollar una API RESTful usando Flask

## Requisitos

Se requieren los siguientes programas para la ejecución del proyecto:

- [Python 3.x](https://www.python.org/downloads/)
- [Git](https://git-scm.com/)

## Instalación

### 1. Clonar el repositorio

Abrir una terminal y ejecutar el comando:

```bash
git clone https://github.com/ferlop85/CARPETA_PROY_FINAL/
```

### 2. Navegar al directorio del proyecto

```bash
cd BACKEND
```

### 3. Crear un entorno virtual

En **Windows**:

```bash
py -3 -m venv .venv
```

En **macOS/Linux**:

```bash
python3 -m venv .venv
```

### 4. Activar el entorno virtual

En **Windows**:

```bash
.venv\Scripts\activate
```

En **macOS/Linux**:

```bash
source .venv/bin/activate
```

### 5. Instalar las dependencias

Las dependencias necesarias se encuentran en el archivo `requirements.txt`:

```bash
pip install -r requirements.txt
```

### 6. Ejecutar el proyecto

```bash
python main.py
```

## Estructura del Proyecto

```
├── api/
│   ├── __init__.py
│   ├── db/
│       └── test_db.py
├── main.py
├── .venv/
├── requirements.txt
└── README.md
```

- `api/`: Carpeta principal del código fuente de la aplicación.
- `main.py`: Archivo de inicio de la aplicación
- `requirements.txt`: Archivo que contiene las dependencias del proyecto.
- `.venv/`: Entorno virtual (esta carpeta está en `.gitignore` y no debe ser incluida en el repositorio).