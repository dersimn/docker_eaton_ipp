FROM debian
MAINTAINER benesis002@outlook.com

RUN apt-get update && apt-get install -y curl
RUN curl http://powerquality.eaton.de/Support/Software-Drivers/Downloads/IPS/ipp-linux_1.61.158-1_amd64.deb -o ipp.deb
RUN dpkg -i ipp.deb
RUN rm ipp.deb

WORKDIR /usr/local/Eaton/IntelligentPowerProtector
EXPOSE 4679
CMD ["./mc2", "-start"]

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f http://localhost:4679 || exit 1
