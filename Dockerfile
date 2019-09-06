FROM divante/vue-storefront-api:latest

RUN apk update
RUN apk add git
RUN apk imagemagick

COPY config /var/www/config
COPY migrations /var/www/migrations
COPY scripts /var/www/scripts
COPY src /var/www/src

COPY ecosystem.json /var/www/ecosystem.json
COPY package.json /var/www/package.json
COPY babel.config.js /var/www/babel.config.js
COPY tsconfig.json /var/www/tsconfig.json
COPY nodemon.json /var/www/nodemon.json
