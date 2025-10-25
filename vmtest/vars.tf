variable "proxmox_api_url" {
  description = "URL de la API de Proxmox"
  type        = string
}

variable "proxmox_user" {
  description = "Usuario de Proxmox"
  type        = string
}

variable "proxmox_pass" {
  description = "Pass Proxmox"
  type        = string
}

variable "proxmox_tls_insecure" {
  description = "Ignorar la verificacióe TLS"
  type        = bool
  default     = true
}

variable "proxmox_node" {
  description = "Nodo de Proxmox donde se crearáa VM"
  type        = string
}

variable "template_name" {
  description = "Nombre del template de Ubuntu 24.04 con cloud-init"
  type        = string
}

variable "vm_name" {
  description = "Nombre de la máina virtual"
  type        = string
}

variable "vm_cores" {
  description = "Num de cores de la VM"
  type        = number
}

variable "vm_memory" {
  description = "Cantidad de memoria de la VM en MB"
  type        = number
}

variable "vm_disk_size" {
  description = "Espacio disco de la VM en GB"
  type        = string
}

variable "vm_storage" {
  description = "Almacenamiento donde se creara disco de la VM"
  type        = string
}

variable "vm_network_bridge" {
  description = "Interfaz de red a la que se conectaráa VM"
  type        = string
}

variable "vm_ip" {
  description = "Direccion de la VM"
  type        = string
}

variable "vm_gateway" {
  description = "Puerta de enlace de la VM"
  type        = string
}

variable "vm_ssh_keys" {
  description = "Claves SSH para la VM"
  type        = string
}
variable "vcpus" {
  description = "Nú de vCPUs"
  type        = number
  default     = 2
}

