#!/bin/bash
rm apps/main
rm src/proto/manager.pb.go

make device-manager-binary
if [ $? == 0 ];then
	echo "make bin ok"
	dmpid=`ps auxw | grep main -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid >> /dev/null 2>&1
	cd apps/
		./main &
	cd ../
	cd demo_test/
	dmpid=`ps auxw | grep demotest -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid >> /dev/null 2>&1


	make demotest
	if [ $? == 0 ];then
		echo "make demotest ok"

			./demotest &

		cd functional_test
		rm dm
		make dm

		if [ $? == 0 ];then
			echo "make dm cli ok"
		else
			dmpid=`ps auxw | grep main -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid>> /dev/null 2>&1

			dmpid=`ps auxw | grep demotest -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid >> /dev/null 2>&1

			echo "make dm cli ng"
		fi

	else
		dmpid=`ps auxw | grep main -m 1 | awk -F' ' '{print $2}'`; kill -9 $dmpid>> /dev/null 2>&1

		echo "make demotest ng"
	fi

else
	echo "make bin ng"
fi
