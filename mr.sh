#!/bin/bash
rm apps/main
make device-manager-binary
dmpid=`ps auxw | grep main -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid
cd apps/
./main &
cd ../
cd demo_test/
dmpid=`ps auxw | grep demotest -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid
make demotest
./demotest &
cd functional_test
rm dm
make dm
