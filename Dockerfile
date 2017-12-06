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

