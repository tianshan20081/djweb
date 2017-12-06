[TOC]

Docker create Django project
----

### Dockerfile
```Dockerfile
FROM daocloud.io/python:3.6.2
ADD requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN mkdir /code
WORKDIR /code
COPY . /code
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
EXPOSE 8010



CMD /code/docker-entrypoint.sh

```

### docker-compose.yml
```docker-compose.yml
version: '3'

services:
  web:
    restart: always
    build: .
    command: /code/manage.py runserver 0.0.0.0:8010
    ports:
      - "8010:8010"
    volumes:
      - .:/code
```

### requirements.txt
```requirements.txt
django==2.0
gunicorn==19.7.1
```


### docker-entrypoint.sh
```docker-entrypoint.sh
/code/manage.py syncdb --noinput
/usr/local/bin/gunicorn djweb.wsgi:application -w 2 -b :8010
```
### ls
```
pwd
~/djweb
ls
Dockerfile docker-compose.yml requirements.txt docker-entrypoint.sh

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


### 