FROM nginx:alpine

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY ssl/cert.pem /etc/nginx/ssl/cert.pem
COPY ssl/cert.key /etc/nginx/ssl/cert.key


CMD ["nginx", "-g", "daemon off;"]
