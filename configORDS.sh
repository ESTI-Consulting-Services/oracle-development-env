#
#ords=$1
#if [ -z $ords]
#then
#    echo "using default binaries..." 
#    ords=ords-21.1.3.153.1102.zip
#    apex=apex_20.2_en.zip
#fi

#if [ ! -e ./oracle-docker-images/.git ]
#then
#    echo "cloning Oracle docker images repo..."
#    git clone git@github.com:ESTI-Consulting-Services/oracle-docker-images.git
#fi


#if [ ! -e $ords ]
#then
#    echo "$ords not found"
#else
#    docker login container-registry.oracle.com
#    docker pull container-registry.oracle.com/java/jdk:17
#    cp $ords ./oracle-docker-images/OracleRestDataServices/dockerfiles/
#    cp $apex ./oracle-docker-images/OracleRestDataServices/dockerfiles/
#   cd ./oracle-docker-images/OracleRestDataServices/dockerfiles/ 
#    ./buildContainerImage.sh -o "--build-arg BASE_IMAGE=container-registry.oracle.com/java/jdk:17"
#fi
if  [ ! -e ./ords_config ]
then
    mkdir ./ords_config
fi

if  [ ! -e ./ords_secrets ]
then
    mkdir ./ords_secrets
fi

docker pull container-registry.oracle.com/database/ords-developer:23.4.0
chmod 777 ./ords_config/
echo 'CONN_STRING="sys as sysdba"/Development19C@oracle-db:1521/DEVPDB' > ords_secrets/conn_string.txt
