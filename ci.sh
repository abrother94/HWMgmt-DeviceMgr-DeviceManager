#!/bin/bash

FILES=(
"apps/main"
"demo_test/demotest"
"demo_test/functional_test/dm"
"src/proto/manager.pb.go"
)
count="${#FILES[@]}"

for (( c=0; c < "${count}"; c++ ))
do
    F_NAME=${FILES[$c]}
    R=`if [ -f $F_NAME ];then rm $F_NAME; echo "rm $F_NAME";else echo "NO NEED rm $F_NAME" ;fi`
    echo $R
done

git add *
git commit -m "$1" 
git push 
