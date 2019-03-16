# ✔ VDS Auto Config

![version](https://img.shields.io/badge/version-1.0.0-green.svg?style=flat) ![linux](https://img.shields.io/badge/supports-Debian,_Ubuntu-blue.svg?style=flat) [![license](https://img.shields.io/badge/license-MIT-red.svg?style=flat)](https://github.com/koddr/vdsac/blob/master/LICENSE.md)

### For GNU/Linux Debian 9 Stretch

Clone this repo:

```bash
$ git clone git@github.com:koddr/vdsac.git
```

Run `init.sh` from root dir:

```bash
$ cd vdsac
$ sudo chmod u+x init.sh
$ sudo ./init.sh
```
#### Init options

* `auto` — automatic installation

### Nginx configuration

```bash
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
    gzip_disable "msie6";
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript;

    include /etc/nginx/conf.d/*.conf;
}
```

### Enjoy configured VDS 🎉

![serverless](https://user-images.githubusercontent.com/11155743/54482355-139c3300-4853-11e9-97f8-f3f865c7c16f.png)
