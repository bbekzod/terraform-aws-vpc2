output "default_security_group_id" {
  value = aws_vpc.example.default_security_group_id

}

output "owner_id" {
  value = aws_vpc.example.owner_id

}

output "azs" {
  value = data.aws_availability_zones.available.names
}

