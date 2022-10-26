FROM node:16.15.0
WORKDIR /app
COPY package*.json ./
RUN npm install --location=global npm@8.12.1
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node","server.js"]