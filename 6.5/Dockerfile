FROM centos:7

RUN adduser elasticsearch && usermod -aG wheel elasticsearch

#RUN groupadd -S elasticsearch && userdd -S elasticsearch -G elasticsearch

#RUN echo 'cassandra  ALL=(ALL) /bin/su' >>  /etc/sudoers

#USER elasticsearch

RUN yum -y update && yum -y install wget && yum install -y perl-Digest-SHA

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-linux-x86_64.tar.gz

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-linux-x86_64.tar.gz.sha512

RUN shasum -a 512 -c elasticsearch-7.15.2-linux-x86_64.tar.gz.sha512

RUN tar -xzf elasticsearch-7.15.2-linux-x86_64.tar.gz

RUN chown -hR elasticsearch /elasticsearch-7.15.2

#COPY elasticsearch.yml /elasticsearch-7.15.2/config/

WORKDIR /elasticsearch-7.15.2/

EXPOSE 9200 9300

USER elasticsearch

CMD ["./bin/elasticsearch","-Ehttp.host=0.0.0.0"]
#-Des.insecure.allow.root=true -d
