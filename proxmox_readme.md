# Overview

## Base settings

**OS**: Proxmox VE 9.2

| Option               | Value            |
|----------------------|------------------|
| Filesystem           | ext4             |
| Disk                 | /dev/sda         |
| Management Interface | nic0             |
| Hostname (FQDN)      | pve.home.arpa    |
| Hostname             | pve              |

## Run ansible

```shell
ansible-playbook \
    -i proxmox_inventory_example.yml \
    -u root --ask-pass \
    proxmox.yml
```
