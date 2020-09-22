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
# Домашняя работа docker-4

1) Изучили как работает сеть Docker
2) Параметризован docker-compose.yml, приложения разнесены по разным сетям
3) По умолчанию, в качестве имени проекта используется имя директории, можно задать через переменную COMPOSE_PROJECT_NAME.
4) (*) Создан docker-compose.override.yml

# Домашняя работа gitlab-ci-1

1) Создана VM в Yandex.Cloud с помощью Terraform
2) (*) С помощью плейбуков Ansible на VM устанавливается Docker и запускаются контейнеры с Gitlab и Gitlab runner и регистрируем его
3) (*) В пейпланне собирается контейнер с приложением reddit

# Домашняя работа monitoring-1

1) Знакомство с Prometheus
2) (*) Добавлен экспортер для mongodb(на основе https://github.com/percona/mongodb_exporter)
3) (*) Добавлен BlackBox экспортер на основе Cloudprober
4) (*) Создан Makefile
Ссылка на Docker Hub: https://hub.docker.com/repositories/ilyafedotov

# Домашняя работа monitoring-2
1) Продолжение изучения Prometheus
2) (*) Build и push новых образов добавлены в Makefile
3) (*) Настроена отдача метрик Docker демоном и настроен дашборд Docker Engine Metrics(https://grafana.com/grafana/dashboards/1229)
4) (**) Настроено автоматическое добавление источников данных и дашбордов в Grafana

# Домашняя работа logging-1

1) Знакомство с EFK стеком.
2) (*) Добавлен grok паттерн для разбора второго типа логов сервиса ui
3) Знакомство с распределенным трейсинком на примере Zipkin
4) (*) Траблшутинг UI: Изначально приложение не работало из-за дефолтных переменных POST_SERVICE_HOST и POST_SERVICE_PORT, решилось добавлением их в Dockerfile. Задержка была на этапе db_find_single_post(167 строка файла post_app.py: time.sleep(3))


# Домашняя работа kubernetes-1

1) Пройден Kubernetes The Hard Way
2) (*) Создана Ansible роль, описывающая развертывание мастер-ноды кластера(шаг 08-bootstrapping-kubernetes-controllers)

# Домашняя работа kubernetes-2

1) Подготовлены манифесты для приложения Reddit
2) Развернут Kubernetes в Yandex.Cloud и в нем запущено приложение Reddit
