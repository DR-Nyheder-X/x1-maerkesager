#!/bin/sh -x
set +e

host=brnbw
dir="/var/www/drex01.brnbw.com/public"

NODE_ENV=production npm run build
cp -r nyheder build
ssh $host "mkdir -p $dir"
rsync -ruv --no-perms build/* $host:$dir

