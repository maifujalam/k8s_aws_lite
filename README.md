# k8s_aws_lite

Steps to orovision the AWS imfrastructure for a Kubernetes cluster using Terraform.
1. Build aws s3 bucket manually/aws console: terraform-s3-maifuj
2. AWS Key pair: k8s_aws_lite/terraform/key_pairs/default_rsa
3. AWS IAM ec2 full profile: k8s_aws_lite/terraform/iam/policies/ec2-full
4. AWS instance launch template for Ubuntu: k8s_aws_lite/terraform/launch-templates/ubuntu
5. AWS VPC import:
   a. cd k8s_aws_lite/terraform/network/vpc/vpc-default-mumbai
   b. terraform import module.vpc.aws_vpc.default <vpc_unique_id> 
   c. terraform play
6. AWS subnets:
    a. cd k8s_aws_lite/terraform/network/subnets/subnet-mumbai
    c. Terraform apply
7. AWS security groups:
    a. cd k8s_aws_lite/terraform/network/security-groups
    b. Terraform apply
8. Create EIP:
    a. cd k8s_aws_lite/terraform/network/elastic-ip
    b. Terraform apply
9. AWS NAT instance:
    a. cd k8s_aws_lite/terraform/network/nat-instance
    b. Terraform apply
10. AWS Route Table:
    a. cd k8s_aws_lite/terraform/network/route-tables/private-nat-route-table
    b. Terraform apply
11. Make the IP forwarding rule:
    a. sh k8s_aws_lite/shellscripts/nat-forward.sh
12. Provision 4 nodes:
    a. cd k8s_aws_lite/terraform/instances
    b. Terraform apply