FROM node:9

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin:/app

USER node
RUN npm install -g elm create-elm-app
USER root

WORKDIR /app

COPY package.json ./
COPY /client/elm-package.json ./client/
RUN npm install --only=production

COPY . .

RUN npm run build

EXPOSE 3001

CMD ["node", "./bin/www"]
