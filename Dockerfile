FROM c73base
RUN yum install -y httpd mariadb-server mod_php php-mysql python-setuptools; yum clean all
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
COPY mysql_setup.sh /root/mysql_setup.sh
RUN chmod +x /root/mysql_setup.sh
RUN bash -c "/root/mysql_setup.sh"
RUN rm /root/mysql_setup.sh
RUN easy_install supervisor
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 80
COPY web.tar /var/www/html/.
RUN cd /var/www/html;tar -xvf /var/www/html/web.tar
RUN rm /var/www/html/web.tar
ENTRYPOINT ["/usr/bin/supervisord","-c", "/etc/supervisord.conf"]

