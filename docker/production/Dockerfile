FROM node:10-alpine

ENV VS_ENV prod

WORKDIR /var/www

RUN apk add --no-cache curl git

COPY package.json ./
COPY yarn.lock ./

RUN apk add --no-cache --virtual .build-deps ca-certificates wget python make g++ && \
    yarn install --no-cache && \
    apk del .build-deps

COPY docker/production/vue-storefront-api.sh /usr/local/bin/

RUN apk update && \
    apk add git && \
    apk add imagemagick && \
    rm -rf /var/cache/apk/*

COPY config /var/www/config
COPY migrations /var/www/migrations
COPY scripts /var/www/scripts
COPY src /var/www/src

COPY ecosystem.json /var/www/ecosystem.json
COPY package.json /var/www/package.json
COPY babel.config.js /var/www/babel.config.js
COPY tsconfig.json /var/www/tsconfig.json
COPY nodemon.json /var/www/nodemon.json

CMD ["vue-storefront-api.sh"]
