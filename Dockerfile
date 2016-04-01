FROM node
MAINTAINER Dean DevPerson <dvn.ifrastruct@gmail.com>

# Add a yeoman user 
RUN adduser --disabled-password --gecos "" yeoman && \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Expose the port
EXPOSE 9000

# set HOME so 'npm install' and 'bower install' don't write to /
ENV HOME /home/yeoman

ENV LANG en_US.UTF-8

RUN mkdir /src && chown yeoman:yeoman /src
WORKDIR /src

# Install base required npm modules.
RUN npm install -g yo bower gulp-cli generator-webapp

# Always run as the yeoman user
USER yeoman

CMD /bin/bash
