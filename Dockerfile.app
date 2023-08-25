FROM python:3.8-alpine3.13

#export MONGO_URI=mongodb://YOUR_USERNAME:YOUR_PASSWORD@YOUR_MONGO_HOST:YOUR_MONGO_PORT/YOUR_MONGO_DB_NAME

COPY ./src/ ./app/src/
COPY app.py ./app
COPY requirements.txt ./app

WORKDIR /app

RUN apk add --no-cache --virtual .build-deps gcc musl-dev linux-headers \
    && pip install -r requirements.txt

ENV MONGO_URI=mongodb://admin:1234@172.17.0.2:27017/restaurantsdb?authSource=admin

CMD ["python", "app.py"]