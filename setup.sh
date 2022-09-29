#!/bin/bash

# modify for testing
SRV_ROOT="/srv/nfsv4"
MNT_ROOT="/home/lehrer/Schreibtisch/Austausch"
FSTAB_PATH="/etc/fstab"
EXPORTS_PATH="/etc/exports"

setup() {
    # install nfs server
    sudo apt-get install nfs-kernel-server

    # prepare root directories
    sudo mkdir ${SRV_ROOT}
    mkdir ${MNT_ROOT}
}

# $1: client name (e.g. S12)
# $2: client IP (e.g. 192.168.0.212)
# $3: client subnet mask (e.g. 24 for <ip>/24)
addclient() {
    # prepare client's directory
    sudo mkdir ${SRV_ROOT}/$1
    mkdir ${MNT_ROOT}/$1

    # setup share
    FSTAB_LINE="${MNT_ROOT}/$1 ${SRV_ROOT}/$1    none    bind    0   0"
    EXPORTS_LINE="${SRV_ROOT}/$1  $2/$3(rw,sync,root_squash,no_subtree_check,fsid=0)"
    
    sudo echo ${FSTAB_LINE} >> ${FSTAB_PATH}
    sudo echo ${EXPORTS_LINE} >> ${EXPORTS_PATH}

    scp client.sh $2:/tmp/client.sh
    ssh $2 "/tmp/client.sh $1 $2"
}

reload() {   
    sudo exportfs -ra
    sudo service nfs-kernel-server reload
}
