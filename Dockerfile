
FROM ubuntu:16.04
MAINTAINER K_atc


RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list && \
    apt update && \
    apt install -y git automake pkg-config libssl-dev
RUN apt install -y tmux curl wget bash-completion net-tools strace silversearcher-ag usbutils mlocate vim && updatedb

### install cross compiler
RUN apt install -y binutils-arm-none-eabi gcc-arm-none-eabi gdb-arm-none-eabi

WORKDIR /root
RUN apt install -y libtool libusb-1.0.0-dev libftdi-dev texinfo
RUN git clone https://github.com/ntfreak/openocd.git
RUN cd openocd && git checkout v0.9.0 && ./bootstrap && \
    ./configure --enable-ftdi --enable-legacy-ft2232_libftdi && make -j6 && make install
# RUN git clone https://git.code.sf.net/p/openocd/code openocd-code && \
# RUN cd openocd-code && git checkout refs/tags/v0.9.0 && ./bootstrap && \
#     ./configure --enable-ftdi --enable-legacy-ft2232_libftdi && make -j6 && make install
RUN curl -sk -O https://raw.githubusercontent.com/dwelch67/raspberrypi/master/armjtag/rpi2/raspi.cfg

### expose use device to container
VOLUME /dev/bus/usb:/dev/bus/usb

ENV HOME /root
