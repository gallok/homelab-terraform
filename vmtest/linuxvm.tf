resource "proxmox_vm_qemu" "ubuntu_vm" {
  name        = var.vm_name
  target_node = var.proxmox_node
  clone       = var.template_name
  full_clone = true

  agent     = 1
  os_type   = "cloud-init"
  cores     = var.vm_cores
  sockets   = 1
  cpu_type  = "host"
  memory    = var.vm_memory
  bios      = "seabios"
  vcpus     = var.vcpus
  balloon   = 0
  automatic_reboot = true
  onboot    = true
  tablet    = true
  protection = false
  kvm       = true
  ciupgrade = true
  define_connection_info = true
  force_create = false
  hotplug     = "network,disk,usb"
  skip_ipv4   = false
  clone_wait  = 10

  scsihw    = "virtio-scsi-pci"
  bootdisk  = "scsi0"

  disk {
    size    = var.vm_disk_size
    type    = "disk"
    storage = var.vm_storage
    slot    = "scsi0"
    backup  = true
    iops_r_burst = 0
    iops_wr_burst = 0
    iops_r_burst_length = 0
    iops_wr_burst_length = 0
    iops_r_concurrent = 0
    iops_wr_concurrent = 0
    passthrough = false
    mbps_r_concurrent = 0
    mbps_wr_concurrent = 0
    mbps_r_burst = 0
    mbps_wr_burst = 0
  }

  network {
    id	   = 0
    model  = "virtio"
    bridge = var.vm_network_bridge
    firewall = false
    link_down = false
  }

  ipconfig0 = "ip=${var.vm_ip}/24,gw=${var.vm_gateway}"

  sshkeys = file(var.vm_ssh_keys)

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
