# syntax=docker/dockerfile:1

FROM alpine:latest

RUN apk add --no-cache nodejs npm

WORKDIR /app

ARG MONGO_URI_ARG
# ARG TMDB_KEY_ARG
# ARG JWT_SECRET_ARG
# ARG JWT_EXPIRE_TIME_ARG

ENV MONGO_URI = ${MONGO_URI_ARG}
# ENV TMDB_KEY = ${TMDB_KEY_ARG}
# ENV JWT_SECRET = ${JWT_SECRET_ARG}
# ENV JWT_EXPIRE_TIME = ${JWT_EXPIRE_TIME_ARG}

COPY package.json /app

RUN npm install 

COPY . /app

EXPOSE 3000

CMD [ "npm", "start" ]
