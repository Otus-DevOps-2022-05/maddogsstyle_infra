output "internal_ip_address_app" {
value = module.app.internal_ip_address_app
}
output "internal_ip_address_db" {
value = module.db.db_internal_ip
}
output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}
