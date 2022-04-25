FROM node:14
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY app/* /usr/src/app/
RUN npm install
EXPOSE 8080
CMD node index.js
