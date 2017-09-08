#!/bin/bash
set -ex

brew cask install docker-toolbox
docker-machine create --driver 'virtualbox' default

# Expose variables to output script automatically
docker-machine env default | while read -r line; do
  [[ "$line" == "\#*" ]] && continue

  # Prints line, using a regex, extract either key or value then assign to variable
  key=`echo "$line" | sed 's/export \(.*\)="\(.*\)"/\1/'`
  value=`echo "$line" | sed 's/export \(.*\)="\(.*\)"/\2/'`

  echo "Exporting '$key'='$value' to envman"
  envman add --key "$key" --value "$value"
done

# Need to run via envman as variables are not exposed yet in this process
eval $(docker-machine env default)
envman run docker version
