#!/bin/bash

echo "Hello, World, v2" > index.html
busybox httpd -f -p ${server_port} &