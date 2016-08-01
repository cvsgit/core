FROM debian:latest

RUN apt-get update
RUN apt-get install -y --force-yes cvs xinetd

ADD test/fixtures/cvspserver /etc/xinetd.d/cvspserver

RUN groupadd cvsroot
RUN useradd -g cvsroot -p cvsuser -m cvsuser

RUN mkdir /var/cvsroot
RUN cvs -d /var/cvsroot init

RUN echo cvsuser: > /var/cvsroot/CVSROOT/passwd
# RUN sed -i 's/#\(SystemAuth=yes\)/\1/' /var/cvsroot/CVSROOT/config

RUN chown -R cvsuser /var/cvsroot

EXPOSE 2401

CMD ["xinetd", "-dontfork"]
