#!/bin/sh

git pull && ./gradlew clean bootRepackage buildDocker && docker compose up -d
