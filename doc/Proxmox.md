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

## ZFS
<!-- TODO: Add more info -->

Mount:
```shell
zfs mount tank/example-dataset
```

Unlock with a password:
```shell
zfs load-key tank/example-dataset
```

Check:
```shell
zfs get keystatus,mounted tank/home-server-storage
```

Run NFS:
```shell
systemctl start nfs-kernel-server
```

## Run ansible

```shell
ansible-playbook \
    -i inventory/proxmox.yml \
    playbooks/proxmox.yml
```

```shell
ansible-playbook \
    -i inventory/proxmox-storage.yml \
    playbooks/proxmox-storage.yml
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
tofu init \
  -backend-config="path=path/to/state/proxmox.tfstate"

tofu validate
```

Format:
```shell
tofu fmt
```

Check:
```shell
tofu plan \
  -var-file="path/to/secrets/proxmox.tfvars"
```

Run:
```shell
tofy apply \
  -var-file="path/to/secrets/proxmox.tfvars"
```
