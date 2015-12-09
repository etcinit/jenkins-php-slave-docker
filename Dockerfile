FROM csanchez/jenkins-slave

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y php5 php5-cli php5-curl php5-json \
    php5-sqlite php5-mcrypt php5-xdebug php5-imagick php5-redis \
    && curl -O https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit \
    && curl -O http://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer
    && git clone https://github.com/phacility/libphutil.git /opt/libphutil \
    && git clone https://github.com/phacility/arcanist.git /opt/arcanist

USER jenkins
