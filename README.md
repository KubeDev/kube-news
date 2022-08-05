# kube-news

## Como baixar e rodar

```
# clonar o repositório
git clone https://github.com/leommiranda/kube-news

# ir para a pasta "k8s" deste repositório
cd kube-news/k8s

# rodar
kubectl apply -f deployment.yaml

# conferir até estar rodando (dica: usar watch)
kubectl get all

# acessar localhost:30000 pelo browser
```

## Como atualizar a imagem docker

```
# ir para a pasta "src" deste repositório
cd kube-news/src

# build a imagem docker
docker build . -t leommiranda/kube-news:v[numero_da_versao]

# fazer login para usar o dockerhub
docker login

# subir a imagem docker para o dockerhub
docker push leommiranda/kube-news:v[numero_da_versao]
```

