From httpd

ADD httpd.conf /usr/local/apache2/conf/httpd.conf
ADD httpd-mpm.conf /usr/local/apache2/conf/extra/httpd-mpm.conf
ADD data /usr/local/apache2/htdocs

RUN apt-get update -y && apt-get install goaccess -y 

VOLUME /log
