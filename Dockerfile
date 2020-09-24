FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . . 
RUN npm run build

# /app/build -> contains all stuff needed for production

FROM nginx
# EXPOSE port 80 for AWS/Cloud (not used for local dev)
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
