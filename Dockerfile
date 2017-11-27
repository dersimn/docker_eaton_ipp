FROM i386/debian

MAINTAINER benesis002@outlook.com

RUN apt-get update && apt-get install -y wget
RUN wget http://pqsoftware.eaton.com/install/linux/ipp/ipp-linux_1.53.150-1_i386.deb
RUN dpkg -i --force-architecture ipp-linux_1.53.150-1_i386.deb

CMD
