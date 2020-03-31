FROM debian
RUN apt update && apt install -y nginx

# Setup nginx config for gitweb
COPY etc/mfeller /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/mfeller /etc/nginx/sites-enabled/mfeller

EXPOSE 8080
CMD [ "nginx", "-g", "daemon off;" ]
