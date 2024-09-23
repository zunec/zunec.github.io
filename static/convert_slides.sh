#!/bin/bash

ROOT=./markdown
TARGET=./slides

for file in "$ROOT"/*/*; do
  parentpath="${file#*/}"
  parent="${parentpath%/*}"
  parent="${parent#markdown/}"
  echo "Converting $parentpath"
  targetpath="${parentpath#markdown/}"
  if [[ -z $oldparent ]]; then
    mkdir -p "$TARGET/$parent"
    oldparent="$parent"
  elif [[ $oldparent != $parent ]]; then
    mkdir -p "$TARGET/$parent"
    oldparent="$parent"   
  fi
  realpath .
  pandoc -t revealjs -s --self-contained -o "$TARGET/${targetpath%%.*}.html" "$parentpath" -V revealjs-url=/home/ziga/.docs/reveal.js-5.0.5/ -V theme=solarized
  #pandoc -t revealjs -s --self-contained -o "$TARGET/${targetpath%%.*}.html" "$parentpath" -V revealjs-url=/home/ziga/.docs/reveal.js-5.0.5/ 
done
