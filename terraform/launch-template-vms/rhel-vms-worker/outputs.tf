output "public-ip" {
  value = flatten(module.rhel-vms[*].public_ip)
}
output "private-ip" {
  value = flatten(module.rhel-vms[*].private_ip)
}

output "public_ssh_commands" {
  value = [for ip in flatten(module.rhel-vms[*].public_ip): format("ssh -o ServerAliveInterval=5 -i ~/.ssh/id_rsa ec2-user@%s",ip)]
}
output "private_ssh_commands" {
  value = [for ip in flatten(module.rhel-vms[*].private_ip): format("ssh -o ServerAliveInterval=5 -i ~/.ssh/id_rsa ec2-user@%s",ip)]
}
