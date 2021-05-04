#We use debian
FROM debian:jessie

#Refresh apt-get update
RUN apt-get update

#Install some utilities
RUN apt-get install -y curl make g++

#Install nodejs and npm
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

#Install required npm packages
ADD package.json /package.json
RUN npm install

#Set /src as the working directory for this container
WORKDIR /src

#Open up external access to port
EXPOSE 8150

#Run startup command
CMD ["node","/src/server.js"] 

