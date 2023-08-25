# Pre Challenge

Some extra steps had to be done before start with the Challenge.

# Testing

Test are broken but it wasn't fixed since it wasn't necesary for the Challenge. But requirements are not working.
## Database
MongoDB database wasn't provided but the data was. A MongoDB had to be created and import the data on it.

A bash script was created on the *mongodb* folder to perform that data import on the docker solution.

## Source code wasn't working
The *find_restaurants* method on the [mongoflask.py](src/mongoflask.py) file was broken.

## Modules
Some modules were broken because there were deprecated and had to be fixed using an old Flask version.

Check the [issue](https://stackoverflow.com/questions/76570896/importerror-cannot-import-name-jsonencoder-from-flask-json) here.
# Challenge 1. The API returns a list instead of an object

It only has to [convert](https://www.geeksforgeeks.org/convert-pymongo-cursor-to-json/) the cursor to list and then to json.

For the 204 code, we can overwrite the Flask code response when the query result is empty:

```python
if restaurants:
        return jsonify(restaurants)
    else:
        return ('', 204)
```

# Challenge 2. Test the application in any cicd system

For this challenge the easiest solution will be used: GitHub Actions it's the choice with a simple pipeline that will run the UT on every change on the python files.

The pipeline can be checked on the following file: [`testing.yml`](.github/workflows/actions.yml) on the *.github* folder.

This is a simple workflow where only the UTs will be execute on each commit but only when python files were modified.

> Note: due the previous issues with the test requirements, some off the tests will fail (like it happened locally) but the pipeline work as espected. GitHub will show the following error:

```bash
ERROR: could not install deps [-rrequirements_dev.txt]; v = InvocationError('/tmp/app/.tox/py36/bin/python -m pip install -rrequirements_dev.txt', 1)
```

# Challenge 3 and 4. Dockerize the APP and the database

At this point both, app and database, were dockerized. Using the ofitial image from MonngoDB and a light weight base image.

> Note: if this was a real case, Python code could be compiled a create a from Scratch image with just a binary file.

You can use it following the next steps:

```bash
$ docker build -f Dockerfile.db -t mymongo .
$ docker run --rm -p 27017:27017 --name my-mongo mymongo
$ docker build -f Dockerfile.app -t myflaskapp .
$ docker run --rm -d -p 8080:8080 --name my-flask-app myflaskapp
```

# Challenge 5. Docker Compose it

Create a Docker compose and use a .env file for all the environment variables and also for security (.env file will be excluded from the repository or uploaded with default values).

After create the .env file or change the values on it, you only have to start the docker compose app:

```
$ docker compose up
```

> Note: the images will be builded on each execution to be able to develop new code without the need of build the image manually and update the docker compose stack.

# Final Challenge. Deploy it on kubernetes

All the K8S yaml files are under the *k8s* folder.

Instead of using the .env file like on the docker-compose solution, a secret object will be used and each service will mount as env var the corresponding value.

Each service has its own folder but the shared objects (in this case, only the secret objetc):

```bash
$ tree
.
├── app
│   ├── deployment.yaml
│   └── service.yaml
├── db
│   ├── deployment.yaml
│   └── service.yaml
└── secret.yaml
```

If you have you own cluster, you can create a ingress object and make queries with your web browser but if you run Kubernetes locally and you can't create the ingress object (like on Minikube), you can use port forward in order to use the service from the terminal:

```bash
$ kubectl port-forward svc/flask-restaurant 8080:8080
```