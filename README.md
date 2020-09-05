# ilyafedotov_microservices
ilyafedotov microservices repository

# Домашняя работа docker-2

1) Установлены Docker, docker-compose, docker-machine
2) Выполнено задание со (*) о сравнении команд docker inspect  <u_container_id> и <u_image_id>
3) Создан docker-monolith/Dockerfile, собран образ reddit:latest
4) Образ загружен на Docker hub ilyafedotov/otus-reddit:1.0

# Домашняя работа docker-3

1) Разбили наше приложение на 4 микросервиса(3 микросервиса и DB)
2) Подготовили Dockerfile и собрали контейнеры
3) (*) передали новые алиасы через переменные окружения
```
docker run -d --network=reddit --network-alias=post_db1 --network-alias=comment_db1 mongo:latest 
docker run -d --env POST_DATABASE_HOST=post_db1 --network=reddit --network-alias=post1 ilyafedotov/post:1.0 
docker run -d --env COMMENT_DATABASE_HOST=comment_db1 --network=reddit --network-alias=comment1 ilyafedotov/comment:1.0 
docker run -d --env COMMENT_SERVICE_HOST=comment1 --env POST_SERVICE_HOST=post1 --network=reddit -p 9292:9292 ilyafedotov/ui:1.0
```
4) (*) Оптимизировали Dockerfile UI для уменьшения размера:
```
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
ilyafedotov/ui            3.1                 0481fd46faca        4 seconds ago       69.8MB
ilyafedotov/ui            3.0                 84daaa26cb45        5 minutes ago       278MB
ilyafedotov/ui            2.0                 9ff50d483713        17 minutes ago      449MB
ilyafedotov/ui            1.0                 b745498af5f9        50 minutes ago      770MB
```
