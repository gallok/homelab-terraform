terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url  = var.PM_URL
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
}
