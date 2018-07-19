FROM mhart/alpine-node:10
WORKDIR /usr/src
# set up our npm profile to access private npm modules
ARG NPM_TOKEN
RUN echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" > ~/.npmrc
# what port is exposed
EXPOSE 3000
# copy dependencies required for building
COPY package.json yarn.lock ./
# install deps (prod only)
RUN yarn --production
# copy our main application source
COPY index.js .
# run a HTTP server that returns our $TEXT env
# by accessing it as process.env.TEXT in Node.js
CMD ["node", "index.js"]
