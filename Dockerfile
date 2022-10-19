#Imagem base em debian buster slim 
FROM node:18-buster-slim

#Copia aplicação para dentro do container
COPY src /app 

#location work
WORKDIR /app

RUN npm install

#export o port 8080
EXPOSE 8080

#Executar aplicação
CMD [ "node", "server.js" ]
