#!/bin/sh
set -ex
brands="twitter facebook instagram github"
regular="folder file"
solid="magnifying-glass"

#manual house

dest=static/fa
mkdir -p "${dest}"

url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/brands/

for icon in $brands; do
  icon="${icon}.svg"
  wget -O "${dest}/${icon}" "${url}/${icon}"
done


url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/regular/

for icon in $regular; do
  icon="${icon}.svg"
  wget -O "${dest}/${icon}" "${url}/${icon}"
done


url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/

for icon in $solid; do
  icon="${icon}.svg"
  wget -O "${dest}/${icon}" "${url}/${icon}"
done