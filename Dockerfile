# Dockerfile
FROM node:18.18.0-alpine
# Create destination directory
RUN mkdir -p /app
WORKDIR /app

# Update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# Copy the app, note .dockerignore
COPY . /app
RUN npm install
RUN npm run build

# Listen on container port 3000
EXPOSE 3000

# Listen on all ip addresses and port 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "node", ".output/server/index.mjs" ]