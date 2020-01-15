FROM node:8.10.0-alpine
# Create app directory
ARG COMMENT
ENV COMMENT ${COMMENT:-"default value"}
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install --production
# Bundle app source
COPY . .
EXPOSE 3000
CMD [ "node", "server.js" ]
