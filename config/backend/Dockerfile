FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /config
COPY ./config/backend/entrypoint.sh .
RUN ["chmod", "+x", "entrypoint.sh"]
ADD ../../src/requirements.txt /config/
RUN pip install -r /config/requirements.txt
RUN mkdir /src;
WORKDIR /src