#!/bin/sh
set -ex
brands="twitter facebook instagram github"
regular="folder file "

#manual house

dest=static/fa
mkdir -p "${dest}"

url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/

for icon in $brands; do
  icon="${icon}.svg"
  wget -O "${dest}/${icon}" "${url}/${icon}"
done


url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/

for icon in $regular; do
  icon="${icon}.svg"
  wget -O "${dest}/${icon}" "${url}/${icon}"
done