FROM ubuntu:22.10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-full \
    gnuplot \
    make \
    && apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /usr/share/doc/*
