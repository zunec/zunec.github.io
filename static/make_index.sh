#!/bin/bash

ROOT=./slides
HTTP="/"
OUTPUT=../content/docs/predstavitve/Prezentacije.html

echo "<head>" > $OUTPUT
#echo "<style>" >> $OUTPUT
#echo "body{background:#fdf6e3;font-family: Lato;font-size: 20px;font-weight: bold;  line-height: 1.8;color: #586e75;padding: 40px;}" >> $OUTPUT
#echo "a:link { color:#586e75; text-decoration: none; }" >> $OUTPUT
#echo "a:visited { color:#586e75; text-decoration: none; }" >> $OUTPUT
#echo "</style>" >> $OUTPUT

echo "<title>Prezentacije</title>" >> $OUTPUT
echo "</head>" >> $OUTPUT


echo "<ul>" >> $OUTPUT
for file in "$ROOT"/*/*; do
  parentpath="${file#*/}"
  parent="${parentpath%/*}"
  parent=${parent##*/}
  filename="${file##*/}"
  if [[ -z $oldparent ]]; then
    echo "  <li> $parent </li>" >> $OUTPUT && oldparent="$parent" 
    echo "  <ul>" >> $OUTPUT
  elif [[ $oldparent != $parent ]]; then
    echo "  </ul>" >> $OUTPUT
    echo "  <li> $parent </li>" >> $OUTPUT && oldparent="$parent"
    echo "  <ul>" >> $OUTPUT
  fi
  echo "    <li><a href=\"/$parentpath\">${filename%%.*}</a></li>" >> $OUTPUT
done
echo "  </ul>" >> $OUTPUT
echo "</ul>" >> $OUTPUT
