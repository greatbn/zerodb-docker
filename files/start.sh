#!/bin/sh
cd /data
if [ ! -d "conf" ]
then
    zerodb-manage init_db
fi
zerodb-server
