FROM node:16.15.0

WORKDIR /app  # diretorio atual

COPY ./package.json ./
COPY ./package-lock.json ./
RUN npm install

COPY . .

EXPOSE 8080
CMD ["node", "server.js"]
