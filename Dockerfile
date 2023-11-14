# Use an official NGINX image as the base image
FROM nginx:alpine

# Remove the default NGINX index file
RUN rm -rf /usr/share/nginx/html/*

# Install wget
RUN apk add --no-cache wget

# Copy the static files from the GitHub Pages URL into the NGINX web root
RUN wget -O /usr/share/nginx/html/index.html https://eng21ct0016.github.io/TechTidy/index.html

# Expose port 80 to the outside world
EXPOSE 8000

# Command to start NGINX and keep the container running
CMD ["nginx", "-g", "daemon off;"]
