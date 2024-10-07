FROM container-registry.oracle.com/os/oraclelinux:9-slim

RUN microdnf module enable nginx:1.24 && \
    microdnf install nginx && \
    microdnf clean all

RUN openssl req -new -x509 -days 3650 -nodes -newkey rsa:2048 -keyout /etc/pki/server.key -out /etc/pki/server.crt -subj "/CN=localhost"

RUN <<EOF cat > /etc/nginx/conf.d/default.conf
server {
   listen   443 ssl http2;
   listen   [::]:443 ssl http2;
   server_name   _;
   root           /usr/share/nginx/html;
   autoindex on;
   ssl_certificate "/etc/pki/server.crt";
   ssl_certificate_key "/etc/pki/server.key";
   ssl_session_cache shared:SSL:1m;
   ssl_session_timeout  10m;
   ssl_ciphers PROFILE=SYSTEM;
   ssl_prefer_server_ciphers on;

   location / {
      autoindex on;
   }
}
EOF

CMD ["nginx", "-g", "daemon off;"]
