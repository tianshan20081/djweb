[TOC]

Docker create Django project
----

### Dockerfile
```Dockerfile
FROM daocloud.io/python:3.6.2
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
ADD . /code/
```

### docker-compose.yml
```docker-compose.yml
version: '3'

services:
  web:
    restart: always
    build: .
    command: python3 manage.py runserver 0.0.0.0:8008
    ports:
      - "8008:8008"
    volumes:
      - .:/code
```

### requirements.txt
```requirements.txt
django==2.0
```

### ls
```
pwd
~/djweb
ls
Dockerfile docker-compose.yml requirements.txt

```

### docker-compose run
```
pwd
~/djweb
docker-compose run web django-admin.py startproject djweb 
ls
Dockerfile         db.sqlite3         djweb              docker-compose.yml manage.py          requirements.txt
```

### docker-compose up --build
`docker-compose up --build`

http://localhost:8008