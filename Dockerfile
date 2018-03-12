FROM docker.io/erixero/centos7.3-base-image
RUN yum install -y httpd mod_php php-mysql; yum clean all
EXPOSE 80
COPY web.tar /var/www/html/.
RUN cd /var/www/html;tar -xvf /var/www/html/web.tar
RUN rm /var/www/html/web.tar
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]

