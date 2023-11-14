# Use an official lightweight web server image
FROM nginx:alpine

# Remove the default NGINX index file
RUN rm -rf /usr/share/nginx/html/*

# Copy the content of the src directory to the NGINX web root
COPY src/ /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 8000

# Command to start NGINX and keep the container running
CMD ["nginx", "-g", "daemon off;"]
