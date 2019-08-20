FROM python:3.6-alpine

ENV ELASTALERT_HOME /opt/elastalert

RUN apk add --update --no-cache ca-certificates openssl-dev openssl python3-dev libffi-dev gcc musl-dev libmagic

RUN mkdir /source
WORKDIR /source
USER root

COPY . /source

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python setup.py install

ENTRYPOINT ["elastalert"]
