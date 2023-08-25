# Intro
Steps for run locally the app.

# MongoDB
Run a docker container with the needed init configuration:

```bash
$ echo "default test"
$ docker run -d --name my-mongo \
	-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
	-e MONGO_INITDB_ROOT_PASSWORD=1234 \
	mongo
$ echo "custom image:"
$ docker run --rm -d -p 27017:27017 --name my-mongo mymongo
```

## Check MongDB container
Run the following commands to check the mongodb status:

```bash
root@d46576a3ddc0:/# mongo -u admin -p --authenticationDatabase admin
MongoDB shell version v4.4.24-rc0
Enter password:
connecting to: mongodb://127.0.0.1:27017/?authSource=admin&compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("4a059d70-3e03-49d6-8d8b-cae03c5e699a") }
MongoDB server version: 4.4.24-rc0
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
        https://docs.mongodb.com/
Questions? Try the MongoDB Developer Community Forums
        https://community.mongodb.com
---
The server generated these startup warnings when booting:
        2023-08-23T12:16:56.173+00:00: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
        2023-08-23T12:16:57.088+00:00: /sys/kernel/mm/transparent_hugepage/enabled is 'always'. We suggest setting it to 'never'
---
> show dbs
admin          0.000GB
config         0.000GB
local          0.000GB
restaurantsdb  0.000GB
> use restaurantsdb
switched to db restaurantsdb
> show collections
restaurant
> db.restaurant.find()
```

# Flask app

Some [issues](https://stackoverflow.com/questions/76570896/importerror-cannot-import-name-jsonencoder-from-flask-json) related with the Flask and Mongo modules versions that has to be solved.

requeriments.txt had to be changed.

Ejecutamos el contenedor:

```bash
$ docker run -d -p 8080:8080 --name my-flask-app myflaskapp
```

O, para probar:

```bash
$ docker run -ti --rm -p 8080:8080 --entrypoint=/bin/sh --name test myflaskapp
```

## Testing curls:

``` bash
$ #echo ok curl
$ curl localhost:8080/api/v1/restaurant/55f14312c7447c3da7051b26 |jq
$ #echo for 204
$ curl localhost:8080/api/v1/restaurant/15f14312c7447c3da7051b26 |jq
```

# Docker compose

To run the whole setup:

```bash
$ docker compose up
```