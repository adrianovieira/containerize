# DevOpsDays Brasília
# author: Adriano dos Santos Vieira
build.docker.images:

	# required to build
	rm -rf build
	mkdir -p build

	# build for hugo server
	docker-compose build brasilia.devopsdays.com.br.hugo

	# generate website to build on apache httpd server
	docker-compose run -d brasilia.devopsdays.com.br.hugo
	docker exec `docker-compose ps -q brasilia.devopsdays.com.br.hugo` hugo --baseUrl=http://brasilia.devopsdays.com.br --verbose -d /tmp/website

	# build for apache httpd server
	cp Dockerfile-httpd build
	docker-compose build brasilia.devopsdays.com.br.httpd

#clean:
	# clean up
	docker stop `docker-compose ps -q brasilia.devopsdays.com.br.hugo` || true
	docker rm `docker ps -aq -f exited=2` || true
	docker rmi `docker images -q -f dangling=true` || true
	rm -rf build
	git checkout config.toml || true

prod: enable.Ganalytics build.docker.images

enable.Ganalytics:
	sed -e "s/#Ganalytics/Ganalytics/" -i config.toml
