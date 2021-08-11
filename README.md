# Local, docker-based omnikeeper stack

TODO

## Setup:

### Database:
Run
```bash
sh scripts/setup_reset_database.sh
```
to create a new database (or fully reset the database and start fresh).

### Keycloak:
Added admin user after initial start:
```bash
docker exec -ti omnikeeper-stack_keycloak_1 /opt/jboss/keycloak/bin/add-user-keycloak.sh -r master -u admin -p 123123
docker-compose restart keycloak
```

TODO: create realm/client(s)/superuser role

### SSL/HTTPS
Add/Install the certificate in contrib/tls.key to the "Trusted Root Certification Authorities". This gets rid of https/ssl errors.


## Startup
```bash
docker-compose up -d
```

## Initial Config
omnikeeper starts empty, without a single layer. That means it also has nowhere to write (parts of) its own config. Most features of omnikeeper do not work properly until that is set up. To initially setup a layer and configure it as the layer where omnikeeper should store its own config, follow these steps:
- create a new layer
    - suggested settings:
        - name: __okconfig
        - description: Internal omnikeeper config
        - color: white
        - compute layer brain: none/empty
        - online inbound adapter: none/empty
        - state: ACTIVE
- update base configuration:
    - Config Layerset: __okconfig
    - Config Write Layer: __okconfig