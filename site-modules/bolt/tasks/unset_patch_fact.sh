#!/bin/bash

factfile=$PT_factfile
factname=$PT_factname

sed -i "s/$factname=true/$factname=false/g" $factfile