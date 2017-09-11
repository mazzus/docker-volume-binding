FROM node:6.10.3

COPY yarn.lock package.json ./

RUN yarn

COPY . .

CMD ["yarn", "dev"]