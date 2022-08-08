#!/bin/sh

git pull && ./gradlew clean bootRepackage buildDocker && docker compose up webapp database localstack traefik -d
