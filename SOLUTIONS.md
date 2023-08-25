# Challenge 1. The API returns a list instead of an object

It only has to [convert](https://www.geeksforgeeks.org/convert-pymongo-cursor-to-json/) the cursor to list and then to json.

# Challenge 2. Test the application in any cicd system

For this challenge the easiest solution will be used: GitHub Actions it's the choice with a simple pipeline that will run the UT on every change on the python files.

The pipeline can be checked on the following file: [`.github/workflows/testing.yml`](.github/workflows/actions.yml).

# Challenge 3. Dockerize the APP

At this point both, app and database, were dockerized. Using the ofitial image from MonngoDB and a light weight base image.

> Note: if this was a real case, Python code could be compiled a create a from Scratch image with just a binary file.