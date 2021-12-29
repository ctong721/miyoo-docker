FROM debian:9
ADD toolchain.tar.xz /opt
ENV PATH="${PATH}:/opt/miyoo/bin"
ENV ARCH="arm"
ENV CROSS_COMPILE="arm-miyoo-linux-uclibcgnueabi-"
RUN sed -i "s/deb.debian.org/mirrors.163.com/g" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/mirrors.163.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    build-essential \
    bc \
    libncurses5-dev \
    libncursesw5-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/* 
 WORKDIR /root
