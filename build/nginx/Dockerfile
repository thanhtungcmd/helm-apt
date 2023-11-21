FROM nginx:1.19

RUN mkdir -p /var/www/code
COPY ./code /var/www/code

WORKDIR /var/www

CMD ["nginx", "-g", "daemon off;"]

