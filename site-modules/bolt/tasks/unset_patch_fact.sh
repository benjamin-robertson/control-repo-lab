#!/bin/bash

factfile=$PT_factfile
factname=$PT_factname

echo sed -i "s/$factname=true/$factname=false/g" $factfile

sed -i "s/$factname=true/$factname=false/g" $factfile