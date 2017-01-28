FROM kozo2/iruby-notebook

MAINTAINER Kozo Nishida <knishida@riken.jp>

ADD . /workdir
WORKDIR /workdir

USER root

RUN cd /workdir && apt-get update && apt-get install -yq gnuplot-nox && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    gem install numo-gnuplot && \
    chown -R jovyan:users /workdir
