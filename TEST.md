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