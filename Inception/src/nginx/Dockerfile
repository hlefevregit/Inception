FROM nginx:alpine

COPY ssl/cert.pem /etc/nginx/ssl/cert.pem
COPY ssl/cert.key /etc/nginx/ssl/cert.key
COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
