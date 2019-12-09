# ✅ Virtual Server Auto Config

![version](https://img.shields.io/badge/version-1.2.0-green.svg?style=flat) ![linux](https://img.shields.io/badge/supports-Debian,_Ubuntu-blue.svg?style=flat) [![license](https://img.shields.io/badge/license-MIT-red.svg?style=flat)](https://github.com/koddr/vdsac/blob/master/LICENSE.md)

## The Why?

Аutomation of routine tasks on a new server **for humans**. Only **verified** configs and **best** practices. 

Just `git clone` and run it!

## For GNU/Linux Debian 9 Stretch

Clone this repo:

```console
foo@bar:~$ git clone https://github.com/koddr/vsac.git
```

Run `./init.sh` from root dir:

```console
foo@bar:~$ cd vsac
foo@bar:~$ sudo chmod +x ./init.sh
foo@bar:~$ sudo ./init.sh [OPTIONS]
```
### Options

* `--webserver [NAME]` — web server name, you want to install (support: `nginx`);
* `--python [VERSION]` — Python 3 version, you want to install (support: `3.5.x`, `3.6.x`, `3.7.x`, `3.8.x`)
* `--postgresql [DATABASE]` — PostgreSQL with database name, you want to install

### Nginx configuration

```diff
user nginx;
+ worker_processes auto;

events {
+   use epoll;
    worker_connections 1024;
+   multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log off;
    error_log /var/log/nginx/error.log crit;
+   server_tokens off;

+   keepalive_timeout 30;
+   keepalive_requests 100;

+   reset_timedout_connection on;
+   client_body_timeout 10;
+   send_timeout 2;
    sendfile on;
    tcp_nodelay on;
+   tcp_nopush on;

+   client_max_body_size 1m;

+   open_file_cache max=200000 inactive=20s;
+   open_file_cache_valid 30s;
+   open_file_cache_min_uses 2;
+   open_file_cache_errors on;

+   gzip on;
+   gzip_comp_level 5;
+   gzip_disable "msie6";
+   gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript image/svg+xml image/gif image/png image/jpeg image/x-icon image/webp;

    include /etc/nginx/conf.d/*.conf;
}
```

## Other usefull Bash scripts for automatization

* [SSL] Let's Encrypt — https://github.com/Neilpang/acme.sh

## Enjoy the configured server 🎉

![serverless](https://user-images.githubusercontent.com/11155743/54482355-139c3300-4853-11e9-97f8-f3f865c7c16f.png)

## Developers

- Idea and active development by [Vic Shóstak](https://github.com/koddr) (aka Koddr).

## Project assistance

If you want to say «thank you» or/and support active development `Virtual Server Auto Config`:

1. Add a GitHub Star to project.
2. Twit about project [on your Twitter](https://twitter.com/intent/tweet?text=%23%D0%90utomation%20of%20routine%20tasks%20on%20a%20new%20%23VDS%20%23server%20for%20%23humans%20%F0%9F%8E%89%20Only%20verified%20%23configs%20and%20%23best%20practices%20%F0%9F%91%8D&url=https%3A%2F%2Fgithub.com%2Fkoddr%2Fvsac).
3. If you want, send to project's author some money via PayPal: [@paypal.me/koddr](https://paypal.me/koddr?locale.x=en_EN).

## License

MIT
