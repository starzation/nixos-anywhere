terraform {
  required_providers {
    null       = { source = "registry.terraform.io/hashicorp/null" }
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
