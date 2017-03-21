FROM node:4.8.0

MAINTAINER larswolter

RUN curl https://install.meteor.com/ | sh \
  && apt-get update \
  && apt-get install -y build-essential g++ git

VOLUME /bundle

ENTRYPOINT touch /bundle/starting \
  && git clone https://github.com/larswolter/ultisite.git \
  && cd ultisite \
  && meteor npm install --save sharp@0.17.0 \
  && meteor npm install \
  && exec meteor build --server-only --allow-superuser /bundle
