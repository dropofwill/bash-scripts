#!/bin/bash
#set -o nounset
set -o errexit

mkdir -p Versions

if [[ -e current_version.txt && -e Current.sh ]]
then
  version=$(grep -o -E "[0-9].?[0-9]?" current_version.txt)

  echo "Updating from $version"

  mv "Current.sh" "Versions/Current.$version.sh"

  # "$version" | awk '{sum = $1 += 0.1; printf("%0.1f", sum) > "./current_version.txt"}'
  # awk -v v=$version '{sum = $v += 0.1; printf("%0.1f", sum) > "./current_version.txt"}'
  echo "$version"
  # echo "$version" | awk -v v=$version '{sum = v += 0.1; printf("%0.1f", sum)}'
  new_version=$(echo "$version" | awk '{sum = $1 += 0.1; printf("%0.1f", sum)}')

  echo "$new_version" > ./current_version.txt

  curl https://raw.githubusercontent.com/renardchien/Bash-Exercise-Script/master/AwesomeScript.sh -o Current.sh
else
  echo "Downloading for the first time"

  curl https://raw.githubusercontent.com/renardchien/Bash-Exercise-Script/master/AwesomeScript.sh -o Current.sh
  echo "1.0" > current_version.txt;
fi
