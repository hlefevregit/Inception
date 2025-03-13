FROM debian:bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    git \
    nodejs \
    npm \
    build-essential \
    python3 \
    && apt-get clean

RUN git clone https://github.com/louislam/uptime-kuma.git . && \
    npm install && \
    npm run build

RUN mkdir -p /app/data

EXPOSE 3001

CMD ["node", "server/server.js"]
