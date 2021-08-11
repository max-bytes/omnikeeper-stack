#!/bin/bash

docker-compose down
docker-compose up -d db
docker exec -ti omnikeeper-stack_db_1 psql -U postgres -c "DROP DATABASE omnikeeper;"
docker exec -ti omnikeeper-stack_db_1 psql -U postgres -c "CREATE DATABASE omnikeeper;"
docker-compose up -d

