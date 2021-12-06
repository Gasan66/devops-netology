FROM centos:7

RUN adduser elasticsearch && usermod -aG wheel elasticsearch

RUN yum -y update && yum -y install wget && yum install -y perl-Digest-SHA

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-linux-aarch64.tar.gz

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-linux-aarch64.tar.gz.sha512

RUN shasum -a 512 -c elasticsearch-7.15.2-linux-aarch64.tar.gz.sha512

RUN tar -xzf elasticsearch-7.15.2-linux-aarch64.tar.gz

RUN chown -hR elasticsearch /elasticsearch-7.15.2

RUN chown -hR elasticsearch /var/lib

WORKDIR /elasticsearch-7.15.2/

EXPOSE 9200 9300

USER elasticsearch

CMD ["./bin/elasticsearch"]

