FROM node:14-slim

RUN yarn set version berry

WORKDIR /usr/src/app

COPY .yarn/plugins ./.yarn/plugins/
COPY .yarn/releases ./.yarn/releases/

COPY package.json yarn.lock .yarnrc.yml ./

RUN yarn install --immutable && yarn cache clean

COPY . ./

RUN yarn build

CMD [ "yarn", "start:prod" ]
