# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY src/package*.json ./

# Install dependencies
RUN npm install

# Copy the content of the local src directory to the working directory
COPY src/ .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["npm", "start"]
