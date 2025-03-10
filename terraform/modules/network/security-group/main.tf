# Create Security Group for the Instances
resource "aws_security_group" "instance_sg" {
  name        = var.name
  description = "Allow traffic as per the provided ingress rules"
  vpc_id      = data.aws_vpc.get_vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = "Rule ${ingress.key+1}:- Allow ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  #   # Allow traffic from Load Balancer
  #   ingress {
  #     description      = "Allow traffic from Load Balancer"
  #     from_port        = 0
  #     to_port          = 65535
  #     protocol         = "tcp"
  #     security_groups  = [var.alb_sg_id]  # Allow traffic from the ALB security group
  #   }

  ingress {
    description = "Allow traffic from Self."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }
  ingress {
    description = "Allow ICMP "
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules (Allow all traffic by default)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = var.name
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }
}
