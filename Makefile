NAME=mvn

.QUIET:

all: build run

build:
	docker build --build-arg http_proxy=$$http_proxy --build-arg http_proxy=$$http_proxy --build-arg no_proxy=$$no_proxy -t $(NAME) .

run:
	$(MAKE) CMD=bash exec

compile:
	docker run -it --rm -e MAVEN_OPTS="-Duser.home=/home/ksaito" -v dev_home:/home -u 1000:1000 -e HOME=/home/ksaito -w /home/ksaito/.ghq/github.com/ksaito1125/workflow-multibranch-plugin $(NAME) mvn compile

exec:
	docker run -it --rm -e MAVEN_OPTS="-Duser.home=/home/ksaito" -v dev_home:/home -u 1000:1000 -e HOME=/home/ksaito -w /home/ksaito/.ghq/github.com/ksaito1125/workflow-multibranch-plugin $(NAME) $(CMD)
