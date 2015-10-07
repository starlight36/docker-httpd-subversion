#!/bin/bash
set -e

# Set timezone for container
if [ ! -z $TZ ]; then
	echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
fi

# If no config files in /usr/local/apache2/conf, do init copy.
if [ `ls /usr/local/apache2/conf | wc -l` -eq 0 ]; then
	cp -r /tmp/httpd-conf/* /usr/local/apache2/conf/
fi

exec "$@"