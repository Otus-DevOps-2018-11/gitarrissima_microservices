# 16
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
  
