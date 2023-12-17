```sh
# Dockerfile

FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
```

## cmd

+ `docker build -t test-svc .`
+ `docker run -dit --name my-running-app -p 8080:80 test-svc`
    + http://localhost:8080

## ref
+ [httpd](https://hub.docker.com/_/httpd)
    + Apache HTTP server