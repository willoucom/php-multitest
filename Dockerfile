FROM php:7.0-cli

# System libraries
RUN apt-get update && apt-get install -y \
    wget \
    libbz2-dev

# php libraries
RUN docker-php-ext-install bz2

# php xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Composer
RUN wget https://getcomposer.org/download/1.0.3/composer.phar  && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update

# php codesniffer
RUN pear install PHP_CodeSniffer

# php depend
RUN wget http://static.pdepend.org/php/latest/pdepend.phar && \
    mv pdepend.phar /usr/local/bin/pdepend && \
    chmod +x /usr/local/bin/pdepend

# Php mess detector
RUN wget -c http://static.phpmd.org/php/latest/phpmd.phar && \
    mv phpmd.phar /usr/local/bin/phpmd && \
    chmod +x /usr/local/bin/phpmd

# Php copy/paste detector
RUN wget https://phar.phpunit.de/phpcpd.phar && \
    mv phpcpd.phar /usr/local/bin/phpcpd && \
    chmod +x /usr/local/bin/phpcpd

# Php unit
RUN wget https://phar.phpunit.de/phpunit.phar  && \
    mv phpunit.phar /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit

# Atoum
RUN wget http://downloads.atoum.org/nightly/mageekguy.atoum.phar && \
    chmod +x mageekguy.atoum.phar

WORKDIR /phptest

RUN php -v
