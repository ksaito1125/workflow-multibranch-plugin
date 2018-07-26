FROM maven:3.5.4-jdk-8

RUN apt-get update -y && apt-get install -y \
    ca-certificates \
 && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*
RUN curl -o /usr/share/ca-certificates/toshibaca.cer http://www.iss.toshiba.co.jp/services/ss/ca/manual/certificate/toshibaca.cer \
 && echo toshibaca.cer >> /etc/ca-certificates.conf \
 && update-ca-certificates
