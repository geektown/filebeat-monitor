FROM prima/filebeat
MAINTAINER dingwei <dyw.net@gmail.com>

COPY ustc.list /etc/apt/sources.list

RUN set -x && \
  apt-get update && \
  apt-get install -y python python-pip && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN pwd

COPY requirements.txt /usr/src/app/

RUN pip install -r requirements.txt 

COPY app.py /usr/src/app/

CMD [ "python", "app.py" ]


