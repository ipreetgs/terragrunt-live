output "vm_id" {
  description = "ID of the Virtual Machine"
  value       = vsphere_virtual_machine.vm.id
}

output "vm_name" {
  description = "Name of the Virtual Machine"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_guest_ip_addresses" {
  description = "Guest IP addresses of the Virtual Machine"
  value       = vsphere_virtual_machine.vm.guest_ip_addresses
}