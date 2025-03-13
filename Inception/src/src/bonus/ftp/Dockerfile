FROM alpine:latest

RUN apk update && apk add --no-cache vsftpd dbus shadow

RUN useradd -m ftpuser && echo "ftpuser:ftppassword" | chpasswd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/log/vsftpd

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
