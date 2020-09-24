FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build -> contains all stuff needed for production

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
