FROM csanchez/jenkins-slave

USER root

RUN apt-get update && apt-get install -y php5-cli php5-mcrypt php5-xdebug \
    && curl -O https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit \
    && curl -O http://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

USER jenkins
