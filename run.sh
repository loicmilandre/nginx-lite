#!/bin/bash

podman run -d --rm -v $PWD:/usr/share/nginx/html --security-opt label=disable -p 8443:443 --name nginx-$USER nginx:1.24
