
FROM ubuntu:16.04
MAINTAINER K_atc

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list && \
    apt update && \
    apt install -y git automake pkg-config libssl-dev
RUN apt install -y curl wget bash-completion net-tools strace silversearcher-ag mlocate vim 

ENV HOME /root
