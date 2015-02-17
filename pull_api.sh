#!/bin/bash
set -o nounset
set -o errexit

echo "$0 $1"

curl "http://gdata.youtube.com/feeds/api/videos?alt=json&q=$1" -o ./latest_results.json

sed "s/$1/bananas/g" latest_results.json > ./bananas.txt
