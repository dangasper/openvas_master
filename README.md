Openvas Master Scanner Docker Build

This docker build aims to easily create an Openvas Scanner using postgresql as the backend database in order to facilitate a master type setup with multiple tasks.

This image includes the use of the GSA (Greenbone web interface) in order to provide easy control of creating and maintaining multiple tasks.

Usage:
 - Clone the repo && cd openvas_master
 - 'docker build --rm -t openvas/master:latest .
 - 'docker run --restart=always -d --name=openvas_master -p 443:443 -p 9390:9390openvas/master'
