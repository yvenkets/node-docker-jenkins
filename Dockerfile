FROM node:latest
WORKDIR /usr/src/app
COPY app/* /
RUN npm install
EXPOSE 8080
CMD [ "node","shivam.js" ]
