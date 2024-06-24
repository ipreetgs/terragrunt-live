terraform {
  backend "remote" {
      workspaces {
        # name = "dev1"
            prefix = "my-prefix-"
        }
  } 
  }


module "vm_1" {
  source = "./vm_module"
  vm_name = "demo2"
  vm_cpu = 2
  vsphere_network = var.vsphere_network
  vm_memory = 1024
  vm_disk_size = 30
}

module "vm_2" {
  source = "./vm_module"
  vm_name = "demo"
  vm_cpu = 3
  vsphere_network = var.vsphere_network
  vm_memory = 1024
  vm_disk_size = 40
}

module "vm_3" {
  source = "./vm_module"
  vm_name = "demo4"
  vm_cpu = 5
  vsphere_network = var.vsphere_network
  vm_memory = 2048
  vm_disk_size = 40
}

