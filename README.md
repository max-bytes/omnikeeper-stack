# Introduction

A fully functional, self-contained, docker-powered omnikeeper stack.

Perfect for initial experiments with omnikeeper or as a basis for more sophisticated setups.

omnikeeper main project: https://github.com/max-bytes/omnikeeper

# Requirements

- docker + docker-compose

# Setup

## Setup Database
Run
```bash
docker-compose down
docker-compose up -d db
docker exec -ti omnikeeper-stack_db_1 psql -U postgres -c "DROP DATABASE omnikeeper;"
docker exec -ti omnikeeper-stack_db_1 psql -U postgres -c "CREATE DATABASE omnikeeper;"
docker-compose up -d
```
to create a new database (or fully reset the database and start fresh).

## Fix Keycloak permissions

Keycloak behaves weird regarding mapped volume permissions, fixed by changing permissions of mapped folder and restarting keycloak

```bash
sudo chmod -R 777 data/keycloak/data/
docker-compose restart keycloak
```

## Start Docker containers
```bash
docker-compose up -d
```

## Configure Keycloak

### Configure realm

Either automatically:

- Import realm from `contrib/realm-export.json` using admin UI at http://localhost:9095

or manually:

- create realm acme
- create client omnikeeper
    - set Valid Redirect URIs to *
    - set Web Origins to *
    - mappings
        - Add audience mapping
        - Add user property "id" mapping
    - roles
        - Add client role "__ok_superuser"

### Setup testuser

**In Keycloak admin UI at http://localhost:9095**

- create user "testuser"
    - set credentials (password 123123, not temporary)
    - add client role "omnikeeper" -> "__ok_superuser"

# Start exploring
Visit http://localhost:9080 to reach the omnikeeper technical frontend.

Refer to https://github.com/max-bytes/omnikeeper/wiki for further introduction/documentation.

# Modify Setup

Refer to the `.env` file for a starting point into modifying setup parameters, such as ports and used images.

# High-Availability Setup

## Running
```bash
docker-compose -f docker-compose-ha.yml up -d
```
