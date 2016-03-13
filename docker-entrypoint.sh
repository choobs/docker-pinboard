#!/bin/sh

if [ "$1" = 'phps' ]; then
  if [ ! -f "www/composer.json" ]; then

    cd /www

    # get the source for the app
    git clone https://github.com/intaro/pinboard.git .
    git checkout tags/v1.5.2

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
    
    # deploy the database tables
    ./console migrations:migrate --no-interaction
    
  fi
fi

exec "$@"
