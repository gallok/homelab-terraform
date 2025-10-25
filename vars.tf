# DATOS SERVIDOR PROXMOX
variable "pve_host" {
  description = "Servidor Proxmox Lenovo Thinkcenre"
  default     = "https://pve.gallo.local:8006/api2/json"
}
# USUARIO CONEXION
variable "pve_user" {
  description = "Usuario Proxmox"
  type        = string
  sensitive   = true
  default     = "root@pam"
}
# PASS PARA CONEXION USUARIO PROXMOX
variable "pve_pass" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
  default     = "PASSWORD"
}
# PASS DEL USUARIO LINUX ROOT DEL CONTENEDOR LXC
variable "ct_pass" {
  description = "Container password"
  type        = string
  sensitive   = true
  default     = "test123"
}
# NOMBRE DEL CONTENEDOR LXC
variable "hostname" {
  default = "TERRAFORMTEST01"
}
# SERVIDOR DNS
variable "dns_server" {
  default = "192.168.1.101"
}
# DOMINIO
variable "dns_domain" {
  default = "gallo.local"
}
# CLAVE SSH
variable "ssh_key" {
  default = " ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMVLrICjJueBMJlEzlrSMl8SiZwbSsVL00mEKX61upxVjDA7FHQ9AiWpLUHO4PCBWhQi2B4C6/qRPlmQf8/owExSnSWsRks14YE/2HlIEtJ4d/ANMqyRCzNS2OQpu6l6qBDvIHo2U7//56fVSa4ektf16BHmYkwSMgOsSY7xoTPqejKYte6lfFcJ+lNBn/TJ3nDh56kSSAEewkX55H3mO46xQxjUgR4fZngIUBIXnYLFnoQhU5VirH4t39lL74xFOX4aPSj8EV/tOjYPjgV5Rf36C6NE4I+kKuIwTrTx5wmg4TJlUF33MZQJIMe5g2h4HVZur4YRg27rz9+2FWlhft/452z02+a7KBJWqbP1ZbsKePT+3/jXzHVWON39tEZnU/0ASbPgmphvdugfwhs3J03gLYPjkTXFv7IZ4tY9KQy4OWl4wmOCvUXmcLng5ITNV2aj1+AHcgTHa/VOCfZp5nxpc5GC3930hcF1Ul2aMXlPaKOCrGco6W1rHiJslEaqE= root@ubuntuserver"
}
# PLANTILLA CONTENEDOR LXC QUE USAREMOS
variable "template_name" {
  #default = "external:vztmpl/debian-11-standard_11.0-1_amd64.tar.gz"
  # EN MI CASO
  default = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}
