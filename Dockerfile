# Use an official Nginx image as a parent image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the local contents into the container at /usr/share/nginx/html
COPY . .

# Expose port 8000 for the web application
EXPOSE 8000

# The default command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
