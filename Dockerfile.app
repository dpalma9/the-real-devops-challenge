FROM python:3.8-alpine3.13

RUN mkdir /app

COPY requirements.txt ./app

RUN apk add --no-cache --virtual .build-deps gcc musl-dev linux-headers \
    && pip install -r /app/requirements.txt

ENV MONGO_URI=mongodb://admin:1234@172.17.0.2:27017/restaurantsdb?authSource=admin

COPY ./src/ ./app/src/
COPY app.py ./app

WORKDIR /app

CMD ["python", "app.py"]