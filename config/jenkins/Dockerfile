FROM jenkins:2.60.3
# if we want to install via apt
USER root
# COPY chromedriver /usr/bin
# RUN deb http://packages.linuxmint.com debian import
RUN apt-get update -qq && apt-get install -qqy python3 python3-pip chromedriver
RUN pip3 install -q coverage==4.5.1 jinja2==2.10 pylint-django==0.9.1
RUN pip3 install --upgrade selenium
ADD /src/requirements.txt /config/
RUN pip3 install -r /config/requirements.txt
USER root
RUN pip3 install pylint==1.8.2