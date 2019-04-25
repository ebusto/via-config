#!/bin/sh

SOURCE='https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'

curl -s ${SOURCE} | sort | grep '^0\.0\.0\.0' | grep -v '^0\.0\.0\.0 0\.0\.0\.0' | \
  awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 0.0.0.0\""}' > ads.conf
