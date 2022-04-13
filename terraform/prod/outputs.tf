output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

output "subnet_app-network_id" {
  value = yandex_vpc_subnet.app-subnet.id
}
