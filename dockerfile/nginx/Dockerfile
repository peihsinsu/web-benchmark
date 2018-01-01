From nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD data /usr/share/nginx/html

#RUN apt-get update -y && apt-get install lsb-release wget -y 
#RUN echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/goaccess.list
#RUN apt-get update -y && apt-get install goaccess -y --allow-unauthenticated

VOLUME /log

#ADD run.sh /
#CMD ["bash","run.sh"]
