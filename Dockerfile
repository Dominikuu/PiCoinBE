FROM node:10.13.0

# Create app directory
RUN mkdir -p /usr/src/pi-coin-api
WORKDIR /usr/src/pi-coin-api

# Install app dependencies
COPY ./package.json /usr/src/pi-coin-api
RUN npm install

# Bundle app source
COPY . /usr/src/pi-coin-api

# Build arguments
ARG NODE_VERSION=10.13.0

# Environment
ENV NODE_VERSION $NODE_VERSION
