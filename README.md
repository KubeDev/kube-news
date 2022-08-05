# kube-news

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

