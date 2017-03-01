#!/bin/sh

if [ ! -z "$RABBIT_HOST" ]; then
   sed -r -i "rabbit_host = (.*)/\1=$RABBIT_HOST/g" /etc/ceilometer/ceilometer.conf
fi
if [ ! -z "$RABBIT_USER" ]; then
   sed -r -i "rabbit_userid = (.*)/\1=$RABBIT_USER/g" /etc/ceilometer/ceilometer.conf
fi
if [ ! -z "$RABBIT_PASS" ]; then
   sed -r -i "rabbit_password = (.*)/\1=$RABBIT_password/g" /etc/ceilometer/ceilometer.conf
fi
