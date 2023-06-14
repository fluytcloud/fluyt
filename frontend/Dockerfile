FROM node:18-alpine as node
WORKDIR /app
COPY ./ /app
RUN npm i npm@latest -g
RUN npm install --force
ARG env=prod
RUN npm run build


FROM nginx:1.25.0-alpine
COPY --from=node /app/dist /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
