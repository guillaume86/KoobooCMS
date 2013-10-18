# Kooboo CMS 3.3 Nginx Mono_fastcgi Host
#
# VERSION 0.01

FROM	lopter/raring-base
MAINTAINER Guillaume Lecomte "guillaume86@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y mono-complete
RUN apt-get install -y mono-fastcgi-server4
RUN apt-get install -y nginx

RUN mkdir -p  /var/www/
RUN mkdir -p /var/log/mono
ADD . /var/www/kooboo
WORKDIR /var/www/kooboo

RUN mv -f /var/www/kooboo/fastcgi_params /etc/nginx/fastcgi_params
RUN mv -f /var/www/kooboo/default /etc/nginx/sites-available/default
RUN update-rc.d nginx defaults
EXPOSE 80
CMD ["/var/www/kooboo/start"]
