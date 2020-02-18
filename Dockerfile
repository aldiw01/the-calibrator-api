FROM node:10

# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./

RUN yarn install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8900
CMD [ "yarn", "start" ]