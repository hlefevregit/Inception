FROM alpine:3.20

RUN apk update && apk add --no-cache nginx openssl

RUN getent group www-data || addgroup -g 82 -S www-data && \
    getent passwd www-data || adduser -u 82 -D -S -G www-data www-data


COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY ssl/cert.pem /etc/nginx/ssl/cert.pem
COPY ssl/cert.key /etc/nginx/ssl/cert.key


EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
