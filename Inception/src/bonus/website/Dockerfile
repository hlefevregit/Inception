FROM alpine:3.18

RUN apk update && apk add --no-cache nginx nodejs npm

WORKDIR /app
COPY ts /app/ts
COPY index.html /app/
COPY style.css /app/

RUN npm install -g typescript && \
    tsc /app/ts/main.ts --outDir /app/js

RUN mkdir -p /run/nginx && \
    mkdir -p /var/www/html && \
    cp /app/index.html /var/www/html/ && \
    cp /app/style.css /var/www/html/ && \
    cp /app/js/main.js /var/www/html/

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
