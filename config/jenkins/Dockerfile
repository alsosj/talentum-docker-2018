FROM jenkins:latest
# if we want to install via apt
USER root
# COPY chromedriver /usr/bin
# RUN deb http://packages.linuxmint.com debian import
RUN apt-get update -qq && apt-get install -qqy python3 python3-pip chromedriver
RUN pip3 install -q pymongo coverage jinja2
RUN pip3 install --upgrade selenium
ADD /src/requirements.txt /config/
RUN pip3 install -r /config/requirements.txt
USER root
RUN pip3 install pylint