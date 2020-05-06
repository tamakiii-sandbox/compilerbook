FROM ubuntu:20.04

WORKDIR /home/user

ARG DEBIAN_FRONTEND=noninteractive
ARG TIME_ZONE=UTC

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      gcc \
      make \
      git \
      binutils \
      libc6-dev \
      gdb \
      sudo \
      tzdata \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

RUN ln -snf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && \
    echo ${TIME_ZONE} > /etc/timezone 

RUN adduser --disabled-password --gecos '' user && \
    echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user

USER user
