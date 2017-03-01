# ceilometer-agent-notification docker file

FROM ubuntu:14.04.5

RUN mkdir -p /etc/ceilometer
ADD ceilometer.conf.j2 /etc/ceilometer/ceilometer.conf
ADD pipeline.yaml /etc/ceilometer/pipeline.yaml

RUN mkdir -p /usr/local/share
ADD update-ceilo-config.sh /usr/local/share/update_ceilo_config.sh
RUN chmod +x /usr/local/share/update_ceilo_config.sh
RUN /usr/local/share/update_ceilo_config.sh

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

RUN \
   add-apt-repository cloud-archive:mitaka && \
   apt-get update && apt-get dist-upgrade -y --force-yes && \ 
   apt-get install -y --force-yes ceilometer-agent-notification

CMD ["ceilometer-agent-notification"]
