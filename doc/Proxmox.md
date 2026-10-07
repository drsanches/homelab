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

## SSH

Generate ssh key:

```shell
ssh-keygen -t ed25519 -f ~/.ssh/homelab-key -C "homelab-key"

# Private key: ~/.ssh/homelab-key
# Public key: ~/.ssh/homelab-key.pub
```

Connect:

```shell
ssh -i ~/.ssh/homelab-key user@192.168.1.123
```


## Run ansible

```shell
ansible-playbook \
    -i inventory/proxmox.yml \
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
