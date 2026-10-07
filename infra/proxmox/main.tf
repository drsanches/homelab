#TODO: Finish the configuration

resource "proxmox_virtual_environment_vm" "home_server" {
  name      = "home-server"
  vm_id     = 100
  node_name = "pve"

  cpu {
    cores = 2
  }

  memory {
    dedicated = 4096
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

  initialization {
    ip_config {
      ipv4 {
        address = "${var.home_server_ip}/24"
        gateway = var.gateway_ip
      }
    }

    user_account {
      username = var.home_server_username
      password = var.home_server_password
      keys     = [var.home_server_ssh_public_key]
    }
  }
}
