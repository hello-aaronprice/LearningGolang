#!/usr/bin/env bash

# ./initialize-repo.sh MyDBrootPassword MyDBuserPassword

mkdir .secrets && echo $1 > .secrets/db-password.txt
sed -i 's/MyPassword/'$2'/g' ./.initialize_db/initialize_database.sql

# Uncomments a line in the Docker Compose YML file to mount the .sql file into the docker container for the first run
sed -i 's/#- .\/.initialize_db:\/docker-entrypoint-initdb.d/- .\/.initialize_db:\/docker-entrypoint-initdb.d/' docker-compose.yml

docker compose up -d

# Comments a line in the Docker Compose YML file to not mount the .sql file as the database is now setup
sed -i 's/- .\/.initialize_db:\/docker-entrypoint-initdb.d/#- .\/.initialize_db:\/docker-entrypoint-initdb.d/' docker-compose.yml



