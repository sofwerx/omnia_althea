#!/bin/bash
set -eux
export SERVER=updates
export HTTP_DIR=/usr/share/nginx/html/
for file in profiles/devices/* 
do
<<<<<<< HEAD
	ansible-playbook -e @$file -e @profiles/management/althea-dev.yml firmware-build.yml
=======
	ansible-playbook -e @$file -e @profiles/management/althea-dev.yml -e gateway=true firmware-build.yml
>>>>>>> 6fa302ffbc193f5e837aa3f1d0b51197fb97227a
done


rsync -ahz --delete build/bin/packages $SERVER:$HTTP_DIR/

rsync -ahz --delete build/bin/targets $SERVER:$HTTP_DIR/
