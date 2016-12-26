#!/bin/sh
rm -f /var/run/httpd/httpd.pid

{% if APACHE_SSL == 1 %}
if [ ! -r /etc/httpd/ssl/cert.crt ]; then
  cd  /etc/httpd/ssl
  openssl req -subj '/CN={{APACHE_HOSTNAME}}/O=My Company Name LTD./C=US' -new -newkey rsa:2048 -days 3650 -sha256  -nodes -x509 -keyout cert.key -out cert.crt
fi
{% endif %}
exec httpd -DFOREGROUND
