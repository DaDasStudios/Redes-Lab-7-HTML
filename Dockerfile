# Servidor web Nginx con el sitio estático del grupo
FROM nginx:1.27-alpine

# Solo se copian los archivos del sitio (no el README ni la configuración de Docker)
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY img/ /usr/share/nginx/html/img/
COPY integrantes/ /usr/share/nginx/html/integrantes/

EXPOSE 80
