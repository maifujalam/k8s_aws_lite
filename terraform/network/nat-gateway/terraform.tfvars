region = "ap-south-1"
owner = "skalam"
project = "aws_k8s"
vpc_name="default"
subnet = "subnet-1" # make sure to put NAT gateway on Public subnet to connect with Internet.
nat_gateway = "k8s_aws_nat"
nat_private_ip = "172.31.0.4"  # Aws we are keeping nat on Public Subnet for getting internet.
