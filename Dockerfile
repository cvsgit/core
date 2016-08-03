FROM alpine:latest

RUN apk update
RUN apk add cvs openrc busybox-initscripts

ADD test/fixtures/inetd.conf /etc/inetd.conf

RUN echo 'cvspserver 2401/tcp #CVS PServer' >> /etc/services
RUN echo 'cvspserver 2401/udpp #CVS PServer' >> /etc/services

RUN mkdir /var/cvsroot
RUN cvs -d /var/cvsroot init

# RUN sed -i 's/#\(SystemAuth=yes\)/\1/' /var/cvsroot/CVSROOT/config
RUN echo 'cvsuser:test' > /var/cvsroot/CVSROOT/passwd

# RUN adduser -D cvsuser

# RUN chmod 777 -R /var/cvsroot

# CMD ["cat", "/etc/passwd"]
CMD ["inetd", "-fe"]


# FROM debian:latest
#
# RUN apt-get update
# RUN apt-get install -y --force-yes cvs xinetd
#
# ADD test/fixtures/cvspserver /etc/xinetd.d/cvspserver
#
# RUN mkdir /var/cvsroot
# RUN cvs -d /var/cvsroot init
#
# RUN echo cvsuser: > /var/cvsroot/CVSROOT/passwd
# # RUN sed -i 's/#\(SystemAuth=yes\)/\1/' /var/cvsroot/CVSROOT/config
#
# RUN chown -R cvsuser /var/cvsroot
#
# EXPOSE 2401
#
# CMD ["xinetd", "-dontfork"]
