include {
  path = find_in_parent_folders()
}

terraform {
  # Here's where you'd specify extra Terraform commands or settings if needed
}

# Example: Using variables defined in the parent directory
inputs = {
  vm_name         = "${get_parent_terragrunt_config().inputs.vm_name}"
  availability_zone = "${get_parent_terragrunt_config().inputs.availability_zone}"
  # ... and so on 
}