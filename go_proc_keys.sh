#!/bin/bash
mkdir -p proc_output

set -eu

function compose_html() {
  tag=$1
  table=$2
  err=$3
  (
  echo "<h1>$tag keys</h1>"
  if [[ $(cat $err | wc -c) -gt 0 ]]; then
    echo "<h2>Warnings during processing</h2>"
    echo "<pre>"
    cat $err
    echo "</pre>"
  fi
  echo "<h2>Keys: Left=original, Right=processed (JSON format)</h2>"
  cat $table
  ) > proc_output/keys_${tag}.html
}


#cat ~/work/data/muc34/TASK/CORPORA/dev/key-dev-*     | python scripts/proc_keys.py

cat ~/work/data/muc34/TASK/CORPORA/tst*/key-tst* | python scripts/proc_keys.py


