CMD = docker build
PUSH_CMD = docker push
ARG = --build-arg http_proxy="${http_proxy}"
ARG += --build-arg https_proxy="${https_proxy}"
ARG += --build-arg no_proxy="${no_proxy}"

NAME = torumano
IMAGE  = texlive

.PHONY: all latest 18.04 20.04 push-latest push-18.04 push-20.04 push

all: push

latest: Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ .

18.04: 18.04/Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ $@

20.04: 20.04/Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ $@

22.10: 22.10/Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ $@

push: push-latest push-18.04 push-20.04

push-latest: latest
	$(PUSH_CMD) $(NAME)/$(IMAGE):$<

push-18.04: 18.04
	$(PUSH_CMD) $(NAME)/$(IMAGE):$<

push-20.04: 20.04
	$(PUSH_CMD) $(NAME)/$(IMAGE):$<
