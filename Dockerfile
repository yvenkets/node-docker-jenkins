FROM node:12
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node shivam.js
EXPOSE 8080
CMD [ "npm","start" ]
