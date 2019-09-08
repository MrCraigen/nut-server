FROM python:3.6.9-slim-buster

MAINTAINER marcel@marquez.fr

RUN apt-get update && apt-get -y install cron git wget
RUN git clone https://github.com/blawar/nut.git /root/nut --depth 1 && \
    cd /root/nut && \
    pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb clock google-api-python-client google-auth-oauthlib

COPY /entrypoint.sh /
COPY conf /root/nut/conf

RUN chmod +x /entrypoint.sh

RUN touch /var/log/cron.log && touch /var/log/nut.log

EXPOSE 9000

ENTRYPOINT ["sh", "/entrypoint.sh"]

