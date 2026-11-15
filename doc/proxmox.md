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

## After start

### Home server

1. Unlock ZFS with a password:

  ```shell
  zfs load-key tank/home-server-storage
  ```

2. Mount ZFS

  ```shell
  zfs mount tank/home-server-storage
  ```

3. Check ZFS

  ```shell
  zfs get keystatus,mounted tank/home-server-storage
  ```

4. Run NFS:

  ```shell
  systemctl start nfs-kernel-server
  ```

5. Prepare home-server

## Configuration

### Ansible

Base setup after OS installation:

```shell
ansible-playbook \
    -i inventory/proxmox.yml \
    playbooks/proxmox.yml
```

Setup NFS server as data storage:

```shell
ansible-playbook \
    -i inventory/proxmox-storage.yml \
    playbooks/proxmox-storage.yml
```

### Terraform (OpenTofu)

OpenTofu version: 
```shell
tofu version

#OpenTofu v1.13.1
#on linux_amd64
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
