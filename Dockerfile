FROM jlesage/baseimage-gui:ubuntu-22.04-v4.9.0 AS build


RUN apt-get -q update && \
    apt-get -q -y upgrade && \
    apt-get -q -y install build-essential software-properties-common && \
    apt-get -q -y install curl wget git python3 python3-dev python3-pip paraview


EXPOSE 5800

COPY startup.sh /startapp.sh
RUN chmod +x /startapp.sh

COPY rc.xml.template /opt/base/etc/openbox/rc.xml.template

WORKDIR /config
