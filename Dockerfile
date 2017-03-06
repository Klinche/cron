FROM klinche/php7-fpm

LABEL maintainer "dbrooks@klinche.com"

RUN apt-get update && apt-get install -y cron

WORKDIR /var/www/symfony

ENV CRONTAB_CONF ""

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["cron", "-f"]