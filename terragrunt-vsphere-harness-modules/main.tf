module "vm_1" {
  source = "./vm_module"
  vm_name = "demo2"
  vm_cpu = var.vm_cpu
  vsphere_network = var.vsphere_network
  vm_memory = var.vm_memory
  vm_disk_size = var.vm_disk_size
}

module "vm_2" {
  source = "./vm_module"
  vm_name = "demo"
  vm_cpu = var.vm_cpu
  vsphere_network = var.vsphere_network
  vm_memory = var.vm_memory
  vm_disk_size = var.vm_disk_size
}


