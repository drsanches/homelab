# Overview

**TODO:**
- Fix nextcloud background jobs
- Check service users permissions
- Review NFS approach and improve it (at least isolate network)

**Services:**
- Cockpit
- Nextcloud
- Nginx (proxy)
- mnt-storage.mount (NFS mount, the name and path can be configured)

## After start

1. Start NFS on the proxmox host

2. Mount NFS (the name and path can be configured)

    ```shell
    sudo systemctl start mnt-storage.mount
    ```

3. Start nextcloud

    ```shell
    sudo systemctl start nextcloud
    ```

## Folder structure

```text
/
├── etc/
│   ├── cockpit/
│   │   └── cockpit.conf                    # [Cockpit] Cockpit config for proxying
│   └── systemd/
│       └── system/
│           ├──cockpit.socket.d/
│           │  └── listen.conf              # [Cockpit] Cockpit socket config
│           ├── nginx.service               # [Nginx] Nginx service
│           ├── nextcloud.service           # [Nextcloud] Nextcloud service
│           └── {{ nfs_mount_unit }}.mount  # [NFS] Mount for external storage (contains {{ nextcloud_data_directory }})
│
├── srv/
│   ├── nextcloud/
│   │   ├── docker-copmose.yml              # [Nextcloud] Nextcloud docker compose
│   │   ├── .env                            # [Nextcloud] Environment for docker compose
│   │   └── data/                           # [Nextcloud] Mounted {{ nextcloud_data_directory }}
│   │
│   └── nginx/
│       ├── config/
│       │   ├── conf.d/
│       │   │   ├── cockpit.conf            # [Nginx] Nginx config for cockpit
│       │   │   └── nextcloud.conf          # [Nginx] Nginx config for nextcloud
│       │   └── nginx.conf                  # [Nginx] Main nginx config (includes config.d)
│       ├── ssl/
│       │   ├── server.key                  # [Nginx] Private key
│       │   └── server.crt                  # [Nginx] Certificate
│       ├── logs/
|       |   ├── cockpit/
|       |   |   ├── access.log              # [Cockpit] Access logs
|       |   |   └── error.log               # [Cockpit] Error logs
|       |   ├── nextcloud/
|       |   |   ├── access.log              # [Nextcloud] Access logs
|       |   |   └── error.log               # [Nextcloud] Error logs
|       |   └── error.log                   # [Nginx] Error logs
│       └── docker-compose.yml              # [Nginx] Nginx docker compose
│
└── {{ nextcloud_data_directory }}/
    ├── app_data/
    │   ├── data/                           # [Nextcloud] Nextcloud data of all users
    │   └── config/
    │       └──config.php                   # [Nextcloud] Main nextcloud config
    └── db/                                 # [Nextcloud] Nextcloud database data
 ```

## Configuration

### Ansible

Run in `ansible` directory:

```shell
ansible-playbook \
    -i inventory/home-server.yml \
    playbooks/home-server.yml
```
