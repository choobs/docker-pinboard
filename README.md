# Choobs Pinboard Docker Image #

## Supported tags and respective `Dockerfile` links ##

- [`latest` (pinba/Dockerfile)](https://github.com/choobs/docker-pinboard/blob/master/Dockerfile)

[![](https://badge.imagelayers.io/choobs/pinboard:pinba.svg)](https://imagelayers.io/?images=choobs/pinboard:latest 'Get your own badge on imagelayers.io') [![Docker Stars](https://img.shields.io/docker/stars/choobs/pinboard.svg?style=flat-square)](https://hub.docker.com/r/choobs/pinboard/) [![Docker Pulls](https://img.shields.io/docker/pulls/choobs/pinboard.svg?style=flat-square)](https://hub.docker.com/r/choobs/pinboard/) [![Build Status](https://travis-ci.org/choobs/docker-pinboard.svg?branch=master)](https://travis-ci.org/choobs/docker-pinboard)

## Information ##

- PHP container that deploys and runs [Intaro Pinboard](http://intaro.github.io/pinboard/).
- Requires a mysql server with the [pinba engine plugin](http://pinba.org), see the [choobs mariadb image](https://hub.docker.com/r/choobs/mariadb/).
- The image is based on the [alpine](https://hub.docker.com/_/alpine/) image.
- This version runs on the built in php server on port `8080`.
- The app is deployed in the folder `/www` using git and composer (which is exported as a volume).
- You can specify the `ENV` variables for the mysql connection: `MYSQL_HOST`, `MYSQL_USER`, `MYSQL_PASSWORD`.
- Simplest deployment expects a link called `db` with `MYSQL_ROOT_PASSWORD` exported by the db container.
- Report any issues in the github [issue tracker](https://github.com/choobs/docker-pinboard/issues/new).
