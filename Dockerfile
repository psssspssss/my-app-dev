# Use an official NGINX image as the base image
FROM nginx:alpine

# Remove the default NGINX index file
RUN rm -rf /usr/share/nginx/html/*

# Copy the static files from the GitHub Pages URL into the NGINX web root
COPY --from=alpine wget https://eng21ct0016.github.io/TechTidy /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 8000

# Command to start NGINX and keep the container running
CMD ["nginx", "-g", "daemon off;"]
