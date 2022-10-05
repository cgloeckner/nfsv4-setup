# nfsv4-setup

# Requirements

Server Requirements
- SSH Clients `ssh` and `scp`
- `nfs-kernel-server` (will be installed via `apt-get`)

Client Requirements
- SSH Server
- `nfs-common` (will be installed via `apt-get`)

# Setup

Server Setup
- assuming server to be `192.168.0.200/24`
- and clients `S01` to `S05` on `192.168.0.201/24` to `192.168.0.205/24`
```
./setup.sh --setup
./setup.sh --add S01 192.168.0.201 24 192.168.0.200
./setup.sh --add S01 192.168.0.202 24 192.168.0.200
./setup.sh --add S01 192.168.0.203 24 192.168.0.200
./setup.sh --add S01 192.168.0.204 24 192.168.0.200
./setup.sh --add S01 192.168.0.205 24 192.168.0.200
-/setup.sh --reload
```

# Further Notes

Folders
- Server: `~/Schreibtisch/Austausch/<PCNAME>`
- Client: `~/Austausch`
