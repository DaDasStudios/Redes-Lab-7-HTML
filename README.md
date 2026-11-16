# Capa 7 en práctica: sitio web HTML con Docker

Actividad práctica de la asignatura **INTERNET: Redes y Comunicaciones IP**.

Sitio web hecho en HTML (con una hoja de estilos por página) donde cada integrante del grupo resume lo aprendido en el curso sobre el modelo OSI y escribe una breve biografía. El sitio se sirve con **Nginx** dentro de un contenedor **Docker**, así que cualquiera puede clonarlo y verlo igual en su máquina.

## Integrantes

| Integrante | Página |
|---|---|
| Jesús David Pérez Piñeres | [`integrantes/integrante1.html`](integrantes/integrante1.html) |
| Victoria Alejandra Triana Buritica | [`integrantes/integrante2.html`](integrantes/integrante2.html) |
| Linda Sofia Moreno Gonzalez | [`integrantes/integrante3.html`](integrantes/integrante3.html) |

## Estructura

```text
.
├── README.md
├── Dockerfile
├── docker-compose.yml
├── index.html              # portada del grupo
├── css/
│   ├── estilos.css         # portada
│   ├── jesus.css
│   ├── victoria.css
│   └── linda.css
├── img/
│   ├── osi-capas.svg
│   ├── encapsulamiento.svg
│   ├── jesus.svg
│   ├── victoria.svg
│   └── linda.svg
└── integrantes/
    ├── integrante1.html
    ├── integrante2.html
    └── integrante3.html
```

## Requisitos

- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/get-docker/) (Docker Desktop en Windows o macOS)

No se necesita Docker Hub: la imagen se construye en la propia máquina.

## Cómo ejecutarlo

### 1. Clonar el repositorio

```bash
git clone https://github.com/DaDasStudios/Redes-Lab-7-HTML.git
cd Redes-Lab-7-HTML
```

### 2a. Con Docker Compose (recomendado)

```bash
docker compose up -d --build
```

Abrir en el navegador: <http://localhost:8001>

Para detenerlo:

```bash
docker compose down
```

### 2b. Solo con Docker

```bash
docker build -t sitio-capa7 .
docker run -d -p 8001:80 --name sitio-capa7 sitio-capa7
```

Abrir en el navegador: <http://localhost:8001>

Para detenerlo y borrar el contenedor:

```bash
docker stop sitio-capa7
docker rm sitio-capa7
```

### Sin Docker

Como el sitio es estático, también se puede abrir `index.html` directamente con el navegador.

## Relación con la capa 7

Al abrir `http://localhost:8001`:

1. El navegador envía una petición **HTTP** `GET /` (capa 7).
2. La petición viaja sobre una conexión **TCP** al puerto 8001 del equipo (capa 4).
3. Docker redirige el puerto 8001 del equipo al puerto 80 del contenedor, donde escucha Nginx.
4. Nginx responde `200 OK` con el HTML, y el navegador pide los estilos e imágenes con nuevas peticiones HTTP.

## Licencia

Uso académico.
