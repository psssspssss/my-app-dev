# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the HTML, CSS, and JavaScript files to the webroot
COPY src/ /usr/share/nginx/html/

# Expose port 80 (default for HTTP)
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
