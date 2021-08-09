# Local, docker-based omnikeeper stack

TODO

## Setup:
### Keycloak:
Added admin user after initial start:
```bash
docker exec -ti omnikeeper-stack_keycloak_1 /opt/jboss/keycloak/bin/add-user-keycloak.sh -r master -u admin -p 123123
docker-compose restart keycloak
```
Add/Install the certificate in contrib/tls.key to the "Trusted Root Certification Authorities". This gets rid of https/ssl errors.