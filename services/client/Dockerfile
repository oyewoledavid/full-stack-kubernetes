# base image
FROM node:11.12.0-alpine

# set working directory
WORKDIR /usr/src/app
COPY public /usr/src/app/public
COPY src /usr/src/app/src
# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm install --silent
RUN npm install react-scripts@2.1.8 -g --silent

# start app
CMD ["npm", "start"]
