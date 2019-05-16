FROM 957711056102.dkr.ecr.eu-west-1.amazonaws.com/base-image

# Create app directory
RUN mkdir -p /usr/src
WORKDIR /usr/src

# Install app dependencies
COPY package.json /usr/src
COPY package-lock.json /usr/src
RUN npm install

# Bundle source code
COPY . /usr/src

RUN npm run build
CMD [ "npm", "start" ]