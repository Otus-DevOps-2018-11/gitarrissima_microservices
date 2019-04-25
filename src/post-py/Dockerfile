FROM python:3.6.0-alpine

RUN apk --no-cache add \
    gcc \
    musl-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app

RUN pip install --upgrade pip -r /app/requirements.txt

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
