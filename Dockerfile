FROM python:3.7-alpine
MAINTAINER VH

ENV PYTHONUMBUFFERED 1

COPY ./requirements.txt /requirements.txt
# RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers openssl-dev
# postgresql-dev
RUN apk add --update --no-cache mariadb-client mariadb-connector-c-dev

RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# RUN apk --no-cache add \
#         # for django connecting to mysqldb
#         mariadb-connector-c \
#         # for manage.py dbshell(we use only local dev)
#         mariadb-client \

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
