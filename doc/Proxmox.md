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
    -i inventory/proxmox.yml \
    -u root --ask-pass \
    playbooks/proxmox.yml
```
