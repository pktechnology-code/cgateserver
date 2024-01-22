FROM ubuntu:20.04

COPY jre-8u202-linux-x64.tar /usr/local
WORKDIR /usr/local

RUN tar xvf jre-8u202-linux-x64.tar
ENV JAVA_HOME=/usr/local/jre1.8.0_202
ENV PATH $JAVA_HOME/bin:$PATH
RUN rm /usr/local/jre-8u202-linux-x64.tar

RUN useradd -ms /bin/bash clipsal
COPY ./cgate3/ /usr/local/bin/cgate3

ENV CGATE_APP=/usr/local/bin/cgate3
ENV CGATE_HOME=/home/clipsal/cgate3/home
ENV CGATE_APPDATA=/home/clipsal/cgate3/appdata

RUN mkdir -p $CGATE_HOME/Projects
RUN mkdir -p $CGATE_APPDATA/config

EXPOSE 20023 20024 20025 20026 20123

WORKDIR $CGATE_APP
CMD ["java", "-jar", "cgate.jar"]

