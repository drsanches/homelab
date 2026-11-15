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

## Create certificates

TODO: Refactor

Run in `certs` directory with correct ip:
```shell
./generate_certs.sh 192.168.1.3
```

Or with custom parameters (`ip`, `cert-days`, `root-cert-days`, `root-cn`):
```shell
./generate_certs.sh 192.168.1.3 365 3650 serverCA
```

Reuslts:
```
rootCA.crt - Root certificate (to install)
rootCA.key - Private root key (to sign server certsificates)
rootCA.srl - The number of the last server certificate (to sign the next certificate)

server.crt - Server certificate
server.key - Server private key

Auxiliary files: server.csr, san.cnf
```