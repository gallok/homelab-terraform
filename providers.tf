# DEFINIMOS EL PROVEEDOR Y LA VERSION
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}
# DEFINIMOS LOS PARAMETROS QUE NECESITA EL PROVEEDOR MEDIANTE VARIABLES
provider "proxmox" {
  pm_api_url      = var.pve_host
  pm_user         = var.pve_user
  pm_password     = var.pve_pass
  pm_tls_insecure = true
  # AGREGAMOS LOG PARA TENER DATOS DEL PROCESO
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
