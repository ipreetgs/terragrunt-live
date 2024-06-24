locals {
  jfrog_token = get_env("JFROG_TOKEN", "default-value-if-not-set")
}

remote_state {
  backend = "remote"
  config = {
    hostname = "gurpreet1.jfrog.io"
    organization = "tf2"
    token = local.jfrog_token
    # token="felo"
    # workspaces {
    #     name = "dev"
    #         # prefix = "my-prefix-"
    #     }
  }
}
# Generite file with provider`s (vSphere) data
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "vsphere" {
  # user = ""
  # password = ""
  # vsphere_server = ""
  allow_unverified_ssl = true
}
EOF
}
