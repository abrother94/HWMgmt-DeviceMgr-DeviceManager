#!/bin/sh
# Test send test evnet to event listener
echo " ./t.sh \"172.20.10.11:8889\""
./dm attach $1:120:1:false
./dm setsessionservice $1:"":true:300
token=`./dm logindevice  $1:root:redfish:false| cut -d' ' -f4`;echo $token
./dm sendeventtest $1:$token:uri
