locals {
  this_id                           = compact(coalescelist(aws_instance.jenkins.*.id, [""]))
  this_availability_zone            = compact(coalescelist(aws_instance.jenkins.*.availability_zone, [""]))
  this_private_ip                   = compact(coalescelist(aws_instance.jenkins.*.private_ip, [""]))
  this_security_groups              = coalescelist(aws_instance.jenkins.*.security_groups, [""])
  this_subnet_id                    = compact(coalescelist(aws_instance.jenkins.*.subnet_id, [""]))
  this_tags                         = coalescelist(aws_instance.jenkins.*.tags, [""])
}
output "instance_ip_addr" {
  value = "${join(",", aws_instance.jenkins.*.private_ip)}"
}


output "id" {
  description = "List of IDs of instances"
  value       = local.this_id
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = local.this_availability_zone
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value = "${join(",", aws_instance.jenkins.*.public_ip)}"
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = local.this_security_groups
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = local.this_subnet_id
}

output "tags" {
  description = "List of tags of instances"
  value       = local.this_tags
}