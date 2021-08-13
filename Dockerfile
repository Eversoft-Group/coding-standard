FROM node:latest

RUN mkdir -p /app/src

WORKDIR /app/src

COPY package.json .
COPY yarn.lock .

RUN yarn install

COPY . .

EXPOSE 3000