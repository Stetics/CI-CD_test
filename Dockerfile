# Safe version
FROM nginx:alpine

# CP index.tml -> docker
COPY index.html /usr/share/nginx/html/

# listen port:80
EXPOSE 80
