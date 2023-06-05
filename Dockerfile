# Dockerfile
FROM node:16.18.0-alpine
RUN npm install -g npm@6.14.6
# Set environment to production
ENV NODE_ENV=production
# Copy the configuration files
WORKDIR /opt/app
COPY . .
ENV PATH /opt/node_modules/.bin:$PATH
# Install dependencies
RUN npm install
RUN npm run build
COPY . .
EXPOSE 8080
CMD ["npm", "run", "start"]
