
## Docker Yeoman Base Image

**Dockerfile** for base Yeoman docker image with the webapp generator installed

### Notes

This Dockerfile should provide a reasonable base image for development.

```
FROM <username>/yo-web-app
MAINTAINER Some Developer <user@example.com>
USER root

COPY . /src
RUN chown -R yeoman:yeoman /src

USER yeoman

RUN npm install
```

This assumes your code is in the same directory as your Dockerfile. 

and build your new image with:
`docker build -t <username>/yo-web-app .`

and run with:
`docker run -it -p 9000:9000 -p 35729:35729 -d -v $(pwd)/app:/src/app <username>/yo-web-app gulp serve`



