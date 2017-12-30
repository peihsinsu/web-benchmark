URL=http://localhost/index.html
DURATION=60
RATE=200

nginx:
	@echo "Start web server...."
	docker run -d --name=web -v `pwd`/data:/usr/share/nginx/html -p 80:80 nginx 
	@echo 
httpd:
	@echo "Start web server...."
	docker run -d --name=web -v `pwd`/data:/usr/local/apache2/htdocs -p 80:80 httpd
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

