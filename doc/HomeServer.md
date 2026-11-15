#TODO

## TODO

- Fix nextcloud background jobs
- Check service users permissions

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

## NFS
<!-- TODO: Review the approach and improve -->
<!-- TODO: Isolate network for NFS -->

```shell
sudo systemctl start mnt-storage.mount
```

