resource "aws_lb_target_group" "tg" {
  name        = var.name
  port        = var.port == 32080 ? 80 : 443
  protocol    = var.protocol
  target_type = "ip"
  vpc_id      = data.aws_vpc.get_vpc.id
  health_check {
    enabled             = true
    protocol            = var.protocol
    path                = var.health_check_path
    port                = var.port
    healthy_threshold   = 3
    unhealthy_threshold = 2
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
resource "aws_lb_target_group_attachment" "lb_attach_tg" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = data.aws_instance.get_vm.private_ip
  port             = var.port
}
resource "aws_lb_listener" "lb_listener-http" {
  count = var.protocol == "HTTP" ? 1 : 0
  load_balancer_arn = data.aws_lb.get_lb.arn
  port              = var.port == 32080 ? 80 : 443
  protocol          = var.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
resource "aws_lb_listener" "lb_listener-https" {
  count = var.protocol == "HTTPS" ? 1 : 0
  load_balancer_arn = data.aws_lb.get_lb.arn
  port              = var.port == 32080 ? 80 : 443
  protocol          = var.protocol
  ssl_policy      = var.protocol == "HTTPS" ? "ELBSecurityPolicy-TLS13-1-2-2021-06" : null
  certificate_arn = var.protocol == "HTTPS" ? data.aws_acm_certificate.issued.arn : null
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
