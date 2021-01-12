#!/bin/sh

url="$1"
code="$2"
output="dist/_redirects"
echo $url
echo $code
test -z "$code" && code="$(openssl rand -hex 5 | head -c 5)"
test -n "$url" && echo "/$code $url" >> $output
out="$(column -s ' ' -t -c 2 < $output | sort | uniq)"
echo "$out" | grep -v "^/\*" > $output
echo >> $output
echo "$out" | grep "^/\*" >> $output
