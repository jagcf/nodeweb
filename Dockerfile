FROM node:8.10.0-alpine
# Create app directory
ARG COMMENT
ENV COMMENT ${COMMENT:-"default value"}
WORKDIR /usr/src/app
COPY package*.json ./

COPY . .
RUN ls -ltr
RUN npm install 
RUN ls -ltr
# Bundle app source

EXPOSE 8080
CMD [ "node", "meetupdemo.js" ]
