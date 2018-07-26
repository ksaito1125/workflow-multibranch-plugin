NAME=mvn

DIR=/home/ksaito/.ghq/github.com/ksaito1125/workflow-multibranch-plugin

.QUIET:

all: build run

build:
	docker build --build-arg http_proxy=$$http_proxy --build-arg http_proxy=$$http_proxy --build-arg no_proxy=$$no_proxy -t $(NAME) .

run:
	$(MAKE) CMD=bash exec

test:
	$(MAKE) OPTS="-p 8000:8000" CMD="mvn hpi:run -Djetty.port=8000" exec

compile:
	$(MAKE) CMD="mvn compile" exec

exec:
	docker run -it --rm $(OPTS) -e MAVEN_OPTS="-Duser.home=/home/ksaito" -v dev_home:/home -u 1000:1000 -w $(DIR) $(NAME) $(CMD)
