variable "GOOGLE_PROJECT" {
  type        = string
  default     = "causal-cubist-428122-k3"
  description = "GCP project name"
}

variable "GOOGLE_REGION" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region name"
}

variable "GITHUB_OWNER" {
  type        = string
  default     = "olegign82"
  description = "GitHub owner repository to use"
}

variable "GITHUB_TOKEN" {
  type        = string

  description = "GitHub personal access token"
}

variable "FLUX_GITHUB_REPO" {
  type        = string
  default     = "flux-gitops"
  description = "Flux GitOps repository"
}

variable "FLUX_GITHUB_TARGET_PATH" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}