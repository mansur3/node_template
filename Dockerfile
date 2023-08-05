# FROM node:18-alpine

# ENV PORT 5000


# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# # Installing dependencies
# COPY package*.json /usr/src/app/
# RUN yarn install

# # Copying source files
# COPY . /usr/src/app

# # Building app
# # RUN yarn run build
# EXPOSE 5000

# # Running the app
# CMD ["yarn", "start"]


# Base image with Node.js installed
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Install pm2 globally
RUN npm install -g pm2

# Expose the port on which the Node.js application will listen
EXPOSE 5000

# Start the Node.js application with pm2
CMD ["pm2-runtime", "src/index.js"]