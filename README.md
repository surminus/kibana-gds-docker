# kibana-gds-docker

A small container which runs Kibana 5.2 an nginx reverse proxy.

Currently it utilises htpasswd for some very basic authentication.

I pinched the official elastic kibana-docker method for passing in
arguments ([see here](https://github.com/elastic/kibana-docker/blob/master/build/kibana/bin/kibana-docker)).

It runs on port 6601 so this will need to be exposed as a service in k8s.

## Build

`docker build surminus/kibana-gds-docker .`

`docker run -d -p 6601:6601 kibana-gds-docker`

Browse to http://localhost:6601

## Goal

To eventually use the nginx [auth_request module](https://nginx.org/en/docs/http/ngx_http_auth_request_module.html) against signon, if this is possible.
