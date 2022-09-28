sudo apt-get install nfs-kernel-server

sudo mkdir /srv/nfsv4
sudo mkdir /srv/nfsv4/S01
sudo mkdir /srv/nfsv4/S02
# ...

mkdir /home/lehrer/Schreibtisch/Austausch
mkdir /home/lehrer/Schreibtisch/Austausch/S01
mkdir /home/lehrer/Schreibtisch/Austausch/S02
# ...

# /etc/fstab
/home/lehrer/Schreibtisch/Austausch/S01 /srv/nfsv4/S01  none    bind    0   0
/home/lehrer/Schreibtisch/Austausch/S02 /srv/nfsv4/S02  none    bind    0   0
# ...

# /etc/exports
/srv/nfsv4/S01  192.168.0.201/24(rw,sync,root_squash,no_subtree_check,fsid=0)
/srv/nfsv4/S02  192.168.0.202/24(rw,sync,root_squash,no_subtree_check,fsid=0)
# ...

# back to bash
exportfs -ra
service nfs-kernel-server reload
