URL=http://localhost/pic.png
#URL=http://localhost/index.html
DURATION=60
RATE=200
NGINX=peihsinsu/nginx
HTTPD=peihsinsu/httpd

build-nginx:
	cd dockerfile/nginx && docker build -t ${NGINX} . 
push-nginx: build-nginx
	docker push ${NGINX}
build-httpd:
	cd dockerfile/httpd && docker build -t ${HTTPD} . 
push-httpd: build-httpd
	docker push ${HTTPD}
nginx:
	@echo "Start web server...."
	docker run -d --name=web -v `pwd`/nginx-log:/log -p 80:80 ${NGINX} 
	@echo 
httpd:
	@echo "Start web server...."
	docker run -d --name=web -v `pwd`/httpd-log:/usr/local/apache2/logs -p 80:80 ${HTTPD}
	@echo 
kill-web:
	@echo "Kill web server...."
	docker rm -f web
	@echo 
vegeta-nginx: 
	@echo "Fire vegeta...."
	echo "GET ${URL}" | vegeta attack -duration=${DURATION}s -rate ${RATE}  | tee results.bin | vegeta report
	@echo 
test-nginx: nginx vegeta-nginx kill-web
test-httpd: httpd vegeta-nginx kill-web

