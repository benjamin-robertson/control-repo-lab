#!/bin/bash

factfile=$PT_factfile
factname=$PT_factname
echo $PT_factfile
echo sed -i "s/$factname=true/$factname=false/g" $factfile

sed -i "s/$factname=true/$factname=false/g" $factfile