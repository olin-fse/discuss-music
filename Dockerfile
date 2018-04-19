FROM node:9

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin:/app

WORKDIR /app

COPY package*.json ./
COPY /client/elm-package.json ./client/

# set NPM default global user to root for permissions
# RUN npm -g config set user root

USER node
RUN npm install -g elm create-elm-app concurrently
USER root

RUN npm install --only=prod

# RUN ls -l /app

# USER node
# RUN if [ "$NODE_ENV" != "prod"]; \
#     then npm install --only=dev; \
#     fi
# USER root

COPY . .

RUN npm run build

EXPOSE 3001
# EXPOSE 3000

CMD ["node", "./bin/www"]
