#!/bin/bash

export

params = JSON.parse(STDIN.read)
file = params['filename']
echo $file

cat $file