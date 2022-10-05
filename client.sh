#!/bin/bash

SRV_ROOT="/srv/nfsv4"
MNT_ROOT="/home/schueler/Austausch"
FSTAB_PATH="/etc/fstab"

# $1: client name (e.g. S12)
# $2: server IP  (e.g. 192.168.0.200)
setup() {
    sudo apt-get install nfs-common

    FSTAB_LINE="$2:${SRV_ROOT}/$1   ${MNT_ROOT} nfs defaults    0   0"
    echo ${FSTAB_LINE} | sudo tee -a ${FSTAB_PATH}
}
