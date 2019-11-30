CMD = docker build
ARG = --build-arg http_proxy="${http_proxy}"
ARG += --build-arg https_proxy="${https_proxy}"
ARG += --build-arg no_proxy="${no_proxy}"

NAME = torumano
IMAGE  = texlive

.PHONY: latest 18.04 20.04

latest: Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ .

18.04: 18.04/Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ $@

20.04: 20.04/Dockerfile
	$(CMD) $(ARG) -t $(NAME)/$(IMAGE):$@ $@
