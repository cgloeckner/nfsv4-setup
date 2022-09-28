Example IP: 192.168.0.201

# bash
```
sudo apt-get install nfs-common

sudo mount -t nfs -o nfsvers=4 192.168.0.200:/S01 /home/schueler/Austausch
```

# /etc/fstab
```
192.168.0.200:/srv/nfsv4/S01 /home/schueler/Austausch nfs defaults 0 0
```
