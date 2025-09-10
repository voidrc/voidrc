FROM php:8.3-apache AS base

RUN a2enmod rewrite && \
    apt-get update && apt-get install -y curl libyaml-dev python3 python3-pip && rm -rf /var/lib/apt/lists/* && \
    pecl install yaml && \
    docker-php-ext-enable yaml

ENV PLAYWRIGHT_BROWSERS_PATH=/opt/playwright

RUN pip install --break-system-packages playwright && \
    playwright install --with-deps chromium

# Configure Apache to listen on port 5000 and log to STDOUT
RUN echo "Listen 5000" > /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:5000>/' /etc/apache2/sites-available/000-default.conf && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

COPY src/ .

COPY docker-entrypoint.sh /run

EXPOSE 5000

ENTRYPOINT [ "/run/docker-entrypoint.sh" ]