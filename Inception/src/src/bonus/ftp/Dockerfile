FROM alpine:3.18

RUN apk update && apk add --no-cache vsftpd

RUN adduser -D -h /home/ftpuser ftpuser && \
    echo "ftpuser:ftp1234" | chpasswd

RUN mkdir -p /home/ftpuser/files && \
    chown root:root /home/ftpuser && chmod 755 /home/ftpuser && \
    chown -R ftpuser:ftpuser /home/ftpuser/files

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21100-21110

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
