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


# By putting in a second FROM command, it notes that the previous block is all complete

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# docker build .
# docker run -p 8080:80 (id) - this is the default source port nginx uses (80) 
# 62e0a9178c5ae