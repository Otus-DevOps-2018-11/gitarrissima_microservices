#27
- разобралась с различными способами доступа к сервису
  1. ClusterIP
  2. nodePort
  3. LoadBalancer
- поняла как работает kube-dns
- разобралась с ingress контроллерами - более гибкий в плане возможностей настройки доступ к приложению
- настроила доступ по https
- разобралась с network policy (правда у меня оно так и не заработало)
- но в конфиг доступ для post сервиса я добавила
- разобралась со способами хранения данных:
  1. Volume=emptyDir
  2. Persistent Volume
  3. PersistentVolumeClaim
  4. StorageClass
- выполнила задание со звездочкой:
  описала secret в YAML манифесте 
  

#26
- развернула локальное окружение в виде minikube
- написала набор файлов для разворачивания приложения reddit в kubernetes
- научилась базово работать с deployment, services
- разобралась с namespaces в kubernetes
- разобралась с окружениями в kubernetes
- развернула kubernetes в gce
- запустила приложение reddit в gce http://35.237.41.127:32092/
- разобралась с настройкой дашборда (хотя прокси не перенаправлял меня на правильный урл, на прострорах интернета нашла правильный)
- выполнила задание со звездочкой
  1. развернула kubernetes с помощью терраформа
  2. описала изменеине ролей в yaml манифесте

#25
- создала вручную и проверила работу kubernetes cluster

#23
- разобралась в EFK стеке
- настроила приемку логов от контейнеров приложения в elsaticsearch
- разобралась с парсингом логов в fluentd
- разобралсь с отобоажением данных из elastic в kibana
- выполнила задание со звездочкой:
  1. парсинг логов одного приложения двумя grok фильтрами

#20
- установила prometheus
- собрала и запушила все образы: prometheus и приложения (https://hub.docker.com/u/gitarrissima)
- изучила, какие метрики присылает в prometheus наше приложение
- разобралась с exporter 
- Задания со звездочкой:
  1. добавила мониторинг mongodb
  2. добавила blackbox exporter coudprobe (от Google)
>>>>>>> origin/master

#19
- установила gitlab
- разобралась с конфигурацией: runners, variables, integrations
- скопировала исходные файлы приложения reddit в гитлаб
- научилась запускать тесты
- разобралась с возможностью создания различных окружений
- разобралась с заданием ограничений для шагов
- разобралась с динамическими окружениями
- выполнила задание со звездочкой: 
  1. добавила сборку контейнера с приложением riddit
  2. добавила деплой приложения на сервер
  3. разобралась, как нужно автоматически разворачивать runners, 
     но реализовать не получилось до конца
     источник: https://docs.gitlab.com/runner/configuration/autoscale.html
  4. добавила интеграцию со slack
     https://test-xhk5959.slack.com/messages/CF4B7PJ4C/details/

#17
- более-менее разобралась сетью в докере. примерно поняла, как отлаживать, что происходит в неймспейсах
  у нас на работе swarm кластер. И был случай, когда запущенный на одной ноде сервис переставал быть доступным с других нод
  по сетевому алиасу. никто так и не разобрался, почему это случилось. 
  Теперь жду с нетерпением, когда это случится снова)
- научилась работать с docker-compose файлами. Это действительно очень удобно
- выполнила задания по docker-compose:
  1. добавила 2 сети
  2. параметризовала с помощью .env
  3. базовое имя проекта определяется переменной COMPOSE_PROJECT_NAME 
     и похоже, что если переменная не создана, то берется имя текущей папки
- выполнила задание со звездочками:
  1. для того, чтобы изменять код приложения, не изменяя образы я добавила volume /app
     перезагрузить главный процесс можно kill -1 1
  2. для того, чтобы изменить параметры запуска puma, я добавила command для контейнера comment
     это заменяет CMD, определенный в Dockerfile

#16
- разобралась с работой линтера для Dockerfile
- поправила все Dockerfile
- разобралась в новой микросервисной структуре приложения
- выполнила задания со звездочкой
  1. Запустить контейнеры с другими сетевыми алиасами, передав новые значения через переменные среды
     docker run -d --network=reddit --network-alias=post_db1 --network-alias=comment_db1 mongo:latest
     docker run -d -e POST_DATABASE_HOST=post_db1 --network=reddit --network-alias=post1 gitarrissima/post:1.0
     docker run -d -e COMMENT_DATABASE_HOST=comment_db1 --network=reddit --network-alias=comment1 gitarrissima/comment:1.0
     docker run -d -e POST_SERVICE_HOST=post1 -e COMMENT_SERVICE_HOST=comment1 --network=reddit -p 9292:9292 gitarrissima/ui:1.0
  
  2. Поработала над уменьшением размера контейнера ui, собрав его из ruby-alpine базового образа
  Описание контейнера тут: Dockerfile.ruby.alpine


#15
- разобралась с тем, как работает docker-machine
- развернула машинку с установленным докером с помощью docker-machine
- разобралась, как писать Dockerfile для приложения reddit
- научилась билдить образ docker и сохранять его в registry
- выполнила задание со звездочкой:
  1. поднятие инстансов с помощью terraform (количество задается переменной)
  2. плейбуки ansible для установки докера / запуска приложения
  3. шаблоны packer с установленным docker

#14
- установила docker
- изучила базовые команды
- ответ на задание со *
  чем отличается контейнер от образа:
  в голову приходит только то, что image, в отличие от контейнера, неизменяемая сущность

  как узнать правильный ответ?
  
