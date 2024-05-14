#!/bin/bash

if [ -z ${1} ]; then
  echo "Usage: ${0} new_name"
  exit 1
fi

tmpfile="$(mktemp)"

for file in $(grep -lari "mymodule"); do
  sed "s/mymodule/${1}/g" ${file} > ${tmpfile}
  mv ${tmpfile} ${file}
done
