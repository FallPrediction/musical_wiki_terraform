variable "public_key" {
  type      = string
  sensitive = true
}

variable "app_revision_bucket" {
  default = "app_revision_bucket"
  type    = string
}

variable "app_media_bucket" {
  default = "app_media_bucket"
  type    = string
}
