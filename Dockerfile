# syntax=docker/dockerfile:1

FROM alpine:latest

RUN apk add --no-cache nodejs npm

WORKDIR /app

ARG MONGO_URI
ARG TMDB_KEY
ARG JWT_SECRET
ARG JWT_EXPIRE_TIME

ENV MONGO_URI = ${MONGO_URI}
ENV TMDB_KEY = ${TMDB_KEY}
ENV JWT_SECRET = ${JWT_SECRET}
ENV JWT_EXPIRE_TIME = ${JWT_EXPIRE_TIME}

COPY package.json /app

RUN npm install 

COPY . /app

EXPOSE 3000

CMD [ "npm", "start" ]
