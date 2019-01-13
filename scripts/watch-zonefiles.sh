#!/bin/bash
zonefiles_dir=/var/lib/knot/zones/
inotifywait --monitor --recursive --event modify $zonefiles_dir |
  while read path _ zone; do
    if knotc zone-check $zone $zonefiles_dir$zone; then
      echo "Reloading zone $zone" > /dev/stdout
      knotc zone-reload $zone
    else
      echo "Could not reload zone $zone, because the zonefile is invalid" > /dev/stderr
    fi
  done
