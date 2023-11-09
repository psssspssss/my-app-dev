FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY . .

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
