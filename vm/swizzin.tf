resource "proxmox_vm_qemu" "terraform-test" {
  name        = var.linux_fqdn
  desc        = "terraform deploy"
  target_node = var.PM_node

  clone = var.PM_template

  # The destination resource pool for the new VM
  pool  = ""
  agent = 1
  vmid  = 209
  disk {
    slot    = "scsi0" # Obligatorio en 3.0.1-rc4
    size    = 20      # Tamaño en GB (sin "G")
    type    = "disk"
    storage = "local-lvm" # Almacenamiento en Proxmox (cámbialo si usas otro)
    format  = "raw"       # Opcional, usa "raw" si prefieres
  }
  cores   = 2
  sockets = 1
  memory  = 2048
  network {
    model    = "virtio"
    bridge   = "vmbr0"
    tag      = -1    # Sin VLAN (omite este parámetro si no se necesita)
    firewall = false # Opcional, desactiva firewall en la VM
  }
  ssh_user = var.ssh_user

  os_type   = "cloud-init"
  ipconfig0 = "ip=${var.linux_ip}/${var.linux_subnetmask},gw=${var.linux_gateway}"

  sshkeys = var.ssh_keys

  connection {
    type        = "ssh"
    user        = var.ssh_user
    #private_key = file("~/.ssh/id_rsa")
    private_key = file(pathexpand("/root/.ssh/id_rsa"))
    host = "192.168.1.154"
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

