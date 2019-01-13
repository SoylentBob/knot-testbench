#!/bin/bash
config_dir=/etc/knot
config=$config_dir/knot.conf
inotifywait --monitor --event modify $config |
  while read path _ file; do
    if knotc conf-check; then
       echo "Reloading $config" > /dev/stdout
       knotc reload
     else
       echo "Could not reload $config, because the config is invalid" > /dev/stderr
     fi
   done
