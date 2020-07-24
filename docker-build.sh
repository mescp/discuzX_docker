#!/bin/bash

if [ ! -d "docker/upload" ]; then
    cp -r DiscuzX/upload docker/upload
fi

[ ! -d "volumes" ] && mkdir volumes
if [ ! -d "volumes/discuzx" ]; then
    cp -r DiscuzX/upload/ ./volumes/discuzx
    chmod a+w -R ./volumes/discuzx/config ./volumes/discuzx/data \ 
        ./volumes/discuzx/uc_server/data ./volumes/discuzx/uc_client/data \ 
        ./volumes/discuzx/install　./volumes/discuzx/template
fi

#编译docker
docker build --pull --rm -f "docker/Dockerfile" -t discuz:3.4 "./docker"
