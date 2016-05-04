FROM php:7.0-cli

# System libraries
RUN apt-get update && apt-get install -y \
    wget \
    libbz2-dev

# php libraries
RUN docker-php-ext-install bz2

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
RUN wget https://github.com/atoum/atoum/releases/download/2.6.1/atoum.phar && \
    mv atoum.phar /usr/local/bin/atoum && \
    chmod +x /usr/local/bin/atoum
