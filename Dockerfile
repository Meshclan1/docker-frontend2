# Specify a base image as 'builder' - this notes that everything under the 'FROM' command will be noted as the 'builder phase' - install dependencies and build our app

FROM node:16-alpine as builder

# workdir is /app directory to avoid any conflicts
WORKDIR '/app'

# For the "COPY" command, this copies everything in package.json to the current WORKDIR folder '.'

COPY package.json .

# Install all the dependencies of package.json
RUN npm install

# COPY command copies all of our src code into our WORKDIR - a temporary container created during the image building process
COPY . .

# RUN command

RUN npm run build


# docker build -f Dockerfile .


