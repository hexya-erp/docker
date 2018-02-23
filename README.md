# Hexya
Hexya is an open source ERP and a business application development framework

## How to use this image

This image requires a running PostgreSQL server.
### Start a PostgreSQL server

```bash
$ docker run -d -e POSTGRES_USER=hexya -e POSTGRES_PASSWORD=secret --name db postgres
```

### Start an Hexya instance

```bash
$ docker run -p 8080:8080 \ 
    -e HEXYA_DB_HOST=db \
    -e HEXYA_DB_USER=hexya \
    -e HEXYA_DB_PASSWORD=secret \
    -e HEXYA_LOGSTDOUT=true \
    -e HEXYA_MODULES="github.com/hexya-erp/hexya-addons/sale" \
    --name hexya -t hexya/hexya
```

The alias of the container running Postgres must be db for Hexya to be able to connect to the Postgres server.

### Login 

Log in Hexya by pointing your browser to [http://localhost:8080](http://localhost:8080).

Default credentials are:
- login: admin
- password: admin

## docker-compose.yml example

Here is a docker-compose.yml file ready for use:
```yaml
version: '3'

services:
  db:
    image: postgres:10.1-alpine
    environment:
      POSTGRES_USER: 'hexya'
      POSTGRES_PASSWORD: 'secret'

  hexya:
    image: hexya/hexya
    environment:
      HEXYA_DB_HOST: 'db'
      HEXYA_DB_USER: 'hexya'
      HEXYA_DB_PASSWORD: 'secret'
      HEXYA_LOGSTDOUT: 'true'
      HEXYA_MODULES: 'github.com/hexya-erp/hexya-addons/sale'
    ports:
      - "127.0.0.1:8080:8080"
```