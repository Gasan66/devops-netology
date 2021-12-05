FROM centos:7

RUN yum -y update && yum -y install wget && yum install -y perl-Digest-SHA

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-linux-x86_64.tar.gz

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-linux-x86_64.tar.gz.sha512

RUN shasum -a 512 -c elasticsearch-7.15.2-linux-x86_64.tar.gz.sha512

RUN tar -xzf elasticsearch-7.15.2-linux-x86_64.tar.gz

WORKDIR /elasticsearch-7.15.2/

CMD ./bin/elasticsearch
#-Des.insecure.allow.root=true -d