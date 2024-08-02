terraform {
  backend "remote" {
      workspaces {
        name = "dpp-vsphere"
            # prefix = "my-prefix-"
        }
  } 
  }


module "vm_1" {
  source = "./vm_module"
  # vm_name = "demo2"
  # vm_cpu = 2
  vsphere_network = var.vsphere_network
  # vm_memory = 1024
  # vm_disk_size = 30
}

