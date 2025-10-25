# RECURSOS DEL CONTENEDOR LXC
resource "proxmox_lxc" "terraformtest01" {
  count           = 1
  onboot          = true
  start           = true
  vmid            = "120"
  hostname        = var.hostname
  ostype          = "ubuntu"
  cores           = 2
  cpulimit        = 0
  memory          = 1024
  swap            = 512
  ostemplate      = var.template_name
  password        = var.ct_pass
  pool            = ""
  ssh_public_keys = var.ssh_key

  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }

  nameserver   = var.dns_server
  searchdomain = var.dns_domain

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "192.168.1.151/24"
    gw       = "192.168.1.1"
    firewall = false
  }

  features {
    nesting = true
  }

  unprivileged = false
  target_node  = "pve"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/id_rsa")
    #private_key = file(pathexpand("/home/gallok/terraform/.ssh/id_rsa"))
    host = "192.168.1.151"
  }

  provisioner "file" {
    source      = "/home/gallok/terraform/config/script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
    on_failure = continue
  }
}
