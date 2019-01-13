#!/bin/bash

knotd -c /etc/knot/knot.conf &

sh /usr/bin/watch-knot-config &
sh /usr/bin/watch-zonefiles &

tail -f /dev/stdout
