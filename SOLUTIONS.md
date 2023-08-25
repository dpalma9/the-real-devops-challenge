# Challenge 1. The API returns a list instead of an object

It only has to [convert](https://www.geeksforgeeks.org/convert-pymongo-cursor-to-json/) the cursor to list and then to json.

# Challenge 2. Test the application in any cicd system

For this challenge the easiest solution will be used: GitHub Actions it's the choice with a simple pipeline that will run the UT on every change on the python files.

The pipeline can be checked on the following file: [`.github/workflows/testing.yml`](.github/workflows/actions.yml).

# Challenge 3 and 4. Dockerize the APP and the database

At this point both, app and database, were dockerized. Using the ofitial image from MonngoDB and a light weight base image.

> Note: if this was a real case, Python code could be compiled a create a from Scratch image with just a binary file.

# Challenge 5. Docker Compose it

Create a Docker compose and use a .env file for all the environment variables and also for security (.env file will be excluded from the repository or uploaded with default values).

# Final Challenge. Deploy it on kubernetes

All the K8S yaml files are under the *k8s* folder.

Instead of using the .env file like on the docker-compose solution, a secret object will be used and each service will mount as env var the corresponding value.