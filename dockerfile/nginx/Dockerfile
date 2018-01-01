From nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD data /usr/share/nginx/html

RUN apt-get update -y && apt-get install goaccess -y

VOLUME /log
