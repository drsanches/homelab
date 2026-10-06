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
## Run terraform (OpenTofu)

OpenTofu version: 
```shell
#tofu version

OpenTofu v1.13.1
on linux_amd64
```

Init:
```shell
tofu init
tofu validate
```

Run:
```shell
tofu init
tofu validate
tofu fmt
```
