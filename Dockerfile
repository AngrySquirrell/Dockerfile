FROM ubuntu AS builder
WORKDIR /app
COPY . .

FROM httpd:latest AS dreyhttpd
COPY --from=builder /app /usr/local/apache2/htdocs/

FROM nginx:latest AS dreynginx
COPY --from=builder /app /usr/share/nginx/html/

LABEL maintainer="Guillaume Maugin"
LABEL version="6.9"