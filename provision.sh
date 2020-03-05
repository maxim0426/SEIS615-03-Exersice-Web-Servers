#!/bin/bash

ACTION=${1}
VERSION="1.0.0"

function remove_nginx() {

sudo service nginx stop

rm ./usr/share/nginx/html

sudo yum remove nginx -y
}

function show_version() {

echo "$VERSION"
}

function display_help() {

cat << EOF
Usage: ${0} {-r|--remove|v|--version|-h|--help}

OPTIONS:
        -r | --remove   Stop Nginx service, delete the files in the website document root directory, deinstall Nginx software
        -v | --version  Output a version of the script
        -h | --help     Display the command help

Examples:

        Remove Nginx:
                $ ${0} -r
        Output a version of the script:
                $ ${0} -v 
        Display help:
                $ ${0} -h

EOF
}

case "$ACTION" in
        -h|--help)
                display_help
                ;;
        -r|--remove)
                remove_nginx 
                ;;
        -v|--version)
                show_version "$VERSION"
                ;;
        *)

sudo yum update -y

sudo amazon-linux-extras install nginx1.12 -y

sudo chkconfig nginx on

sudo aws s3 cp s3://rclc-assignment-webserver/index.html /usr/share/nginx/html/index.html

sudo service nginx start

        exit 1
esac

