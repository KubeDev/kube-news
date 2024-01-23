# Projeto kube-news

Semana de imersão do Fabricio Veronez

Projeto estudo do Docker e Kubernetes

Aplicativo mini portal de noticias

Criamos a imagem da aplicação 
PARA CRIAR A IMAGEM DA APLICAÇÃO

docker build -t raco21/kube-news:v2 .
docker images
docker push raco21/kube-news:v2

utilizamos o docker compose - pois tinha no projeto a app e o banco postgres
docker compose up -d --build

Criamos o deployment da aplicação e o Service
PARA PODER ACESSAR A APLICAÇÃO
kubectl port-forward service/kubenews 8080:80

COMANDO PARA VOLTAR A ATUALIZAÇÃO
kubectl rollout undo deployment kubenews && watch 'kubectl get pod'

### Objetivo
O projeto Kube-news é uma aplicação escrita em NodeJS e tem como objetivo ser uma aplicação de exemplo pra trabalhar com o uso de containers.

### Configuração
Pra configurar a aplicação, é preciso ter um banco de dados Postgre e pra definir o acesso ao banco, configure as variáveis de ambiente abaixo:

DB_DATABASE => Nome do banco de dados que vai ser usado.

DB_USERNAME => Usuário do banco de dados.

DB_PASSWORD => Senha do usuário do banco de dados.

DB_HOST => Endereço do banco de dados.
