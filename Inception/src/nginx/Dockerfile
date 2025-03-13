FROM nginx:alpine

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY ssl/cert.pem /etc/nginx/ssl/cert.pem
COPY ssl/cert.key /etc/nginx/ssl/cert.key

RUN getent group www-data || addgroup -g 82 -S www-data && \
    id -u www-data >/dev/null 2>&1 || adduser -u 82 -D -S -G www-data www-data



CMD ["nginx", "-g", "daemon off;"]
