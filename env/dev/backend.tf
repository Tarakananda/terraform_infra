terraform {
  backend "s3" {
    bucket       = "zen-pharma-terraform-state-tarakananda"
    key          = "env/dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
