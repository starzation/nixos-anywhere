terraform {
  required_providers {
    null       = { source = "registry.terraform.io/hashicorp/null" }
    external   = { source = "registry.terraform.io/hashicorp/external" }
  }
}

data "external" "nix-build" {
  program = [ "${path.module}/nix-build.sh" ]
  query = {
    attribute = var.attribute
    file = var.file
  }
}
output "result" {
  value = data.external.nix-build.result
}
