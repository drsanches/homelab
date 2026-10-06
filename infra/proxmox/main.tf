#TODO: Finish the configuration

resource "proxmox_virtual_environment_vm" "home_server" {
  name      = "home-server"
  node_name = "pve"

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/ubuntu-26.04-server-cloudimg-amd64.img"
    size         = 20
    interface    = "scsi0"
  }

  network_device {
    bridge = "vmbr0"
  }
}
