module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster"
}

#module "gke_cluster" {
#  source          = "github.com/olegign82/tf-google-gke-cluster"
#  GOOGLE_PROJECT  = var.GOOGLE_PROJECT
#  GOOGLE_REGION   = var.GOOGLE_REGION
#  GKE_NUM_NODES   = 4
#}

module "tls_private_key" {
  source         = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
  algorithm      = "RSA"
}

module "github_repository" {
  source                   = "github.com/den-vasyliev/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux"
}

# module to point to gke kubeconfig

#module "flux_bootstrap" {
#  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
#  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
#  private_key       = module.tls_private_key.private_key_pem
#  config_path       = module.gke_cluster.kubeconfig
#  github_token      = var.GITHUB_TOKEN
#}

module "flux_bootstrap" {
  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  config_path       = module.kind_cluster.kubeconfig
  github_token      = var.GITHUB_TOKEN
}

#module "flux_bootstrap" {
#  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap?ref=kind_auth"
#  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
#  private_key       = module.tls_private_key.private_key_pem
#  config_host       = module.kind_cluster.endpoint
#  config_client_key = module.kind_cluster.client_key
#  config_ca         = module.kind_cluster.ca
#  config_crt        = module.kind_cluster.crt
#  github_token      = var.GITHUB_TOKEN
#}

