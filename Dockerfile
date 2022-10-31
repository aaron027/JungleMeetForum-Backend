# syntax=docker/dockerfile:1

FROM alpine:latest

RUN apk add --no-cache nodejs npm

WORKDIR /app

ARG MONGO_ARG

ENV  MONGO_ARG = ${MONGO_URI}

COPY package.json /app

RUN npm install 

COPY . /app

EXPOSE 3000

CMD [ "npm", "start" ]