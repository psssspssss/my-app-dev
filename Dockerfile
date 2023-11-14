# Use an official lightweight Node.js image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
#//COPY package*.json ./

# Install any dependencies
RUN npm install

# Copy the content of the src directory to the working directory
COPY src/ .

# Expose port 80 to the outside world
EXPOSE 8000

# Command to run the application
CMD ["npm", "start"]
