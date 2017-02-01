FROM nginx:latest
ARG KIBANA_VERSION=5.1.2
EXPOSE 6601
WORKDIR /opt/kibana
RUN apt-get update && apt-get install -y curl && \
    curl -Ls https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz | tar --strip-components=1 -zxf -

COPY default.conf /etc/nginx/conf.d/default.conf
COPY htpasswd /etc/nginx/.htpasswd
COPY kibana-docker bin/kibana-docker

CMD service nginx start && bin/kibana-docker
