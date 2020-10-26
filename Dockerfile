FROM node:alpine AS builder
WORKDIR /app
COPY ./package.json .
RUN yarn 
COPY . .
RUN yarn build


FROM nginx 
ADD ./nginx/default.conf /etc/nginx/templates/default.conf.template
COPY --from=builder /app/build /usr/share/nginx/html
