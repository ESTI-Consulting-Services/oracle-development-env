#!/bin/bash

db=$1
if [ -z $db]
then
    echo "using default binaries..." 
    db=LINUX.X64_193000_db_home.zip
   
fi

if [ ! -e ./oracle-docker-images/.git ]
then
    echo "cloning Oracle docker images repo..."
    git clone git@github.com:ESTI-Consulting-Services/oracle-docker-images.git
else
    echo "Pulling latest Oracle docker images main branch..."
    git checkout main
    git pull
fi

if [ ! -e $db ]
then
    echo "$db not found, skipping database image build"
   
else
    cp $db oracle-docker-images/OracleDatabase/SingleInstance/dockerfiles/19.3.0/
    ./oracle-docker-images/OracleDatabase/SingleInstance/dockerfiles/buildContainerImage.sh -s -v 19.3.0 -t estidev -o '--build-arg SLIMMING=false'
fi







