#!/bin/sh

if [ "$1" = 'phps' ]; then
  if [ ! -f "www/composer.json" ]; then

    cd /www

    # get the source for the app
    git clone https://github.com/intaro/pinboard.git .
    git checkout tags/v1.5.2

    # install composer
    php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
    php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '781c98992e23d4a5ce559daf0170f8a9b3b91331ddc4a3fa9f7d42b6d981513cdc1411730112495fbf9d59cffbf20fb2') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }"
    php composer-setup.php --install-dir=/bin --filename=composer
    php -r "unlink('composer-setup.php');"

    # configure the app
    cat > /www/config/parameters.yml << EOF
db:
  host: ${MYSQL_HOST:-db}
  name: pinba
  user: ${MYSQL_USER:-root}
  pass: ${MYSQL_PASSWORD:-$DB_ENV_MYSQL_ROOT_PASSWORD}
base_url: /
logging:
  long_request_time:
    global: !!float 1
  heavy_request:
    global: 30000
  heavy_cpu_request:
    global: 1
locale: en
cache: apc
records_lifetime: P1M
aggregation_period: PT15M
pagination:
  row_per_page: 50
secure:
  enable: false
EOF

    # install the app
    composer install --prefer-source --no-interaction
    
    # configure the app
    ./console migrations:migrate --no-interaction

    # link the symfony console to bin
    ln -s /www/console /bin/console
    
  fi
fi

exec "$@"
