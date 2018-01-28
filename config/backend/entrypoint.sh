#!/usr/bin/env bash

until python manage.py makemigrations --settings taller_docker.settings.production
do
    echo "Waiting for postgres..."
    sleep 2
done

python manage.py collectstatic --noinput --settings=taller_docker.settings.production
python manage.py migrate --noinput --settings=taller_docker.settings.production
nohup python manage.py runtasks --noinput --settings=taller_docker.settings.production &

gunicorn sesamo.wsgi -b 0.0.0.0:8000
