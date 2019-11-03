FROM python:2-alpine

RUN pip install octodns

WORKDIR /workdir
ENTRYPOINT ["octodns-sync"]
