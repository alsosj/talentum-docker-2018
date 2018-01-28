#!/usr/bin/env bash

until python manage.py makemigrations --settings taller_docker.settings.prod
do
    echo "Waiting for postgres..."
    sleep 2
done

python manage.py collectstatic --noinput --settings=taller_docker.settings.prod
python manage.py migrate --noinput --settings=taller_docker.settings.prod

gunicorn taller_docker.wsgi -b 0.0.0.0:8000
