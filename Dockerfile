FROM python:3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc python3-dev libpq-dev postgresql-client\
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

RUN django-admin startproject myproject .

# добавление миграций
RUN python manage.py makemigrations
RUN python manage.py migrate

# добавление пользователя admin
RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

# сбор статики
#RUN python manage.py collectstatic

COPY ./myapp /code/