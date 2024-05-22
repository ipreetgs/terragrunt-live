provider "vsphere" {
  user           = "admin@company.local"
  password       = "MyAwesomePassword"
  vsphere_server = "0.0.0.0"
  allow_unverified_ssl = true
}


data "vsphere_datacenter" "dc" {
name = var.vsphere_datacenter
}
data "vsphere_datastore" "datastore" {
name = var.vsphere_datastore
datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
name = var.vsphere_cluster
datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
name = var.vsphere_network
datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_resource_pool" "root_pool" {
name = "DTA-Cluster/Resources"
datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "vm" {
name = var.vm_name
folder = "DTA/FAPSDTA/Deluxe-User-Test"
resource_pool_id = data.vsphere_resource_pool.root_pool.id
datastore_id = data.vsphere_datastore.datastore.id
num_cpus = var.vm_cpu
memory = var.vm_memory
guest_id = var.vm_guest_os_type
firmware = var.vm_firmware
wait_for_guest_net_timeout = 0
cdrom {
client_device = true
}
network_interface {
network_id = data.vsphere_network.network.id
}
disk {
label = "disk0"
size = var.vm_disk_size
thin_provisioned = true
}
}