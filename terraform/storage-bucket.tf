provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
resource "yandex_storage_bucket" "state-storage" {
  bucket        = var.name
  access_key    = var.access
  secret_key    = var.security
  force_destroy = true
}