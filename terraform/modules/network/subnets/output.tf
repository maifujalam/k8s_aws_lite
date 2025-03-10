output "subnet" {
  value = [ for i in aws_subnet.subnet: format("Name: %s   AZ: %s   CIDR: %s",i.tags["Name"],i.cidr_block,i.availability_zone) ]
}
