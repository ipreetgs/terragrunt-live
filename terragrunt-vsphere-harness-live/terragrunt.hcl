locals {
  #credentials = read_terragrunt_config(find_in_parent_folders("credentials.hcl"))
  credentials = "credentials.hcl"
  #server      = read_terragrunt_config(find_in_parent_folders("server.hcl"))
  server = "../server.hcl"
}

# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = "demotfstatefile"
#     key            = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "us-east-1"
#     #dynamodb_table = "your-dynamodb-table-name"
#   }
# }
# Generite file with provider`s (vSphere) data
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "vsphere" {
  user           = "admin@company.local"
  password       = "MyAwesomePassword"
  vsphere_server = "0.0.0.0"
  allow_unverified_ssl = true
}
EOF
}



# inputs = merge(
#   local.common_vars.locals,
#   yamldecode(file(find_in_parent_folders("terraform.tfvars")))
# )