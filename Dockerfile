FROM alpine:latest

RUN apk update
RUN apk add cvs busybox-initscripts openssl

RUN echo "cvspserver stream tcp nowait root /usr/bin/cvs cvs --allow-root=/var/cvsroot pserver" > /etc/inetd.conf
RUN echo "cvspserver 2401/tcp #CVS PServer" >> /etc/services

RUN mkdir /var/cvsroot

VOLUME ["/var/cvsroot"]

RUN echo "#!/bin/sh" > run.sh
RUN echo "cvs -d /var/cvsroot init" >> run.sh
RUN echo "echo 'cvsuser:'$(openssl passwd -crypt nopasswd) > /var/cvsroot/CVSROOT/passwd" >> run.sh
RUN echo "inetd -fe" >> run.sh

RUN chmod +x run.sh

CMD ["/run.sh"]
