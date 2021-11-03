FROM python:3.9-slim

RUN apt-get update \
 && apt-get install -y \
      gettext \
      graphviz \
      imagemagick \
      make \
 && apt-get autoremove \
 && apt-get clean

RUN python3 -m pip install -U pip
RUN python3 -m pip install tox

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
