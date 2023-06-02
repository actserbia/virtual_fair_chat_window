# Dockerfile
FROM node:12.18.3-alpine

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