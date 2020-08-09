#!/bin/bash
docker network inspect equest_proxy >/dev/null 2>&1 || \
  docker network create equest_proxy

# Docker-compose automatically grabs envs from just .env

COMPOSE_HTTP_TIMEOUT=120 docker-compose -f docker-compose.yaml -f confluent.docker-compose.yaml up -d
$@