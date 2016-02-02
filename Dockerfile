from ubuntu:14.04

ENV BASEDIR /root/

RUN apt-get update
RUN apt-get install -y curl libxml2 build-essential patch ruby-dev zlib1g-dev python-setuptools
RUN gem install nokogiri predictionio

RUN bash -c "$(curl -s http://install.prediction.io/install.sh)"

ENV PATH $BASEDIR/PredictionIO/bin/:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN sh -c 'echo "n\n" | pio template get g2crowd/template-scala-parallel-universal-recommendation UniversalRecommendation --name G2Crowd --package com.g2crowd --email dev@g2crowd.com'
