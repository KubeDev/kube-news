FROM node:18.12.1
WORKDIR /APP
COPY package*.json ./
run npm install
COPY ..
EXPOSE 8080
CMD ["node", "server.js"]