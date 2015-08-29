FROM csanchez/jenkins-slave

USER root

RUN apt-get update && apt-get install -y php5-cli php5-mcrypt php5-xdebug \
    php5-sqlite php5-mysql php5-curl php5-intl php5-json php5-memcache \
    php5-memcached php5-redis \
    && curl -O https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit \
    && curl -O http://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

USER jenkins
