#!/bin/bash
# Colors
GREEN="\033[0;32m"
NC="\033[0m"
# Add deb repo
{
    sudo echo ""
    sudo echo "# Nginx"
    sudo echo "deb http://nginx.org/packages/mainline/debian/ stretch nginx"
    sudo echo "deb-src http://nginx.org/packages/mainline/debian/ stretch nginx"
    sudo echo ""
} >> /etc/apt/sources.list.d/nginx.list
# Download and add signing key
sudo wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
# Remove previous installation
sudo apt remove nginx nginx-common -y
# Update
sudo apt update && apt upgrade -y
# Install
sudo apt install nginx -y
# Create config
sudo cat >/etc/nginx/nginx.conf <<EOL
user nginx;
worker_processes auto;

events {
    use epoll;
    worker_connections 1024;
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log off;
    error_log /var/log/nginx/error.log crit;
    server_tokens off;

    keepalive_timeout 30;
    keepalive_requests 100;

    reset_timedout_connection on;
    client_body_timeout 10;
    send_timeout 2;
    sendfile on;
    tcp_nodelay on;
    tcp_nopush on;

    client_max_body_size 1m;

    open_file_cache max=200000 inactive=20s;
    open_file_cache_valid 30s;
    open_file_cache_min_uses 2;
    open_file_cache_errors on;

    gzip on;
    gzip_comp_level 5;
    gzip_disable "msie6";
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript image/svg+xml image/gif image/png image/jpeg image/x-icon image/webp;

    include /etc/nginx/conf.d/*.conf;
}
EOL
# Unmask
sudo systemctl unmask nginx
# Enable
sudo systemctl enable nginx
# Start
sudo service nginx start
# Reload
sudo nginx -s reload
sudo nginx -t
# Exit message
{
    echo ""
    echo "░"
    echo -e "░ ${GREEN}✔ Nginx installed and configured!${NC}"
    echo "░"
    echo ""
}
