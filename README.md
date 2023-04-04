# Проект "DJ DOCKER"

Проект "DJ DOCKER" — это простое Django приложение, которое запускается в контейнерах Docker. В приложении используется база данных PostgreSQL, а также административный интерфейс Adminer для управления базой данных.

## Запуск проекта

Для запуска проекта необходимо установить Docker и Docker Compose на свой компьютер. После этого нужно склонировать репозиторий с проектом:

```bash
git clone https://github.com/AX2048/DJ_DOCKER.git
```



Затем нужно перейти в директорию с проектом и запустить команду:

```bash
docker-compose up
```

После этого контейнеры Docker будут созданы и запущены. Django приложение будет доступно на порту 8000, а Adminer будет доступен на порту 8080. Для остановки контейнеров нужно выполнить команду:

```
docker-compose down
```

Django: http://127.0.0.1:8000

Adminer: http://127.0.0.1:8080


## Структура проекта

Проект содержит следующие файлы и директории: 
- `README.md` - файл с описанием проекта 
- `Dockerfile` - файл для сборки образа Django приложения 
- `docker-compose.yml` - файл для запуска контейнеров Docker 
- `myapp/` - директория с Django приложением 
- `myapp/settings.py` - файл с настройками Django приложения 
- `requirements.txt` - файл со списком зависимостей Python для Django приложения 
- `myapp/static/` - директория со статическими файлами Django приложения 
- `myapp/templates/` - директория с шаблонами Django приложения 
- `postgres-data/` - директория для хранения данных PostgreSQL

## Изменение настроек

Если нужно изменить настройки Django приложения, то нужно отредактировать файл `myapp/settings.py`. Если нужно добавить новые зависимости Python, то нужно добавить их в файл `myapp/requirements.txt`. После этого необходимо пересобрать Docker образ командой:

```
docker-compose build
```

`settings.py`:
```
import os
...
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'mydb',
        'USER': 'myuser',
        'PASSWORD': 'mypassword',
        'HOST': 'db',
        'PORT': '5432',
    }
}
...
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
```

## Дополнительные команды

Для выполнения миграций базы данных необходимо запустить контейнер в интерактивном режиме и выполнить команду `python manage.py migrate`:

```
docker-compose run --rm web python manage.py migrate
```

Для создания суперпользователя Django необходимо запустить контейнер в интерактивном режиме и выполнить команду `python manage.py createsuperuser`:

```
docker-compose run --rm web python manage.py createsuperuser
```

Для сбора статических файлов Django необходимо запустить контейнер в интерактивном режиме и выполнить команду `python manage.py collectstatic`:

```
docker-compose run --rm web python
```

## Доступы

DJ:
```
		'USER': 'djadmin',
        'PASSWORD': 'djadmin'
```

ADMINER:
```
        'NAME': 'mydb',
        'USER': 'myuser',
        'PASSWORD': 'mypassword',
        'HOST': 'db',
```