resource "aws_alb" "alb" {  
  name            = var.alb_name
#  subnets         = ["${var.lb_subnet_ids}"]
  subnets	   = ["subnet-ca295683", "subnet-cecd4c95"]
  security_groups = var.vpc_security_group_ids
  internal        = var.internal_alb  
  idle_timeout    = var.idle_timeout
  tags = {    
    Name    = "${var.alb_name}"    
  }   
  access_logs {    
    bucket = var.s3_bucket    
    prefix = "ELB-logs"  
  }
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = aws_alb.alb.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol
  
  default_action {    
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    type             = "forward"  
  }
}

resource "aws_alb_target_group" "alb_target_group" {  
  name     = var.target_group_name
  port     = var.alb_listener_port
  protocol = "HTTP"  
  vpc_id   = var.vpc_id
  tags = {    
    name = var.target_group_name    
  } 
}

#Instance Attachment
resource "aws_alb_target_group_attachment" "svc_physical_external" {
  count = "1"
  target_group_arn = aws_alb_target_group.alb_target_group.arn
#  target_id        = aws_instance.jenkins.id
#  target_id 	    = aws_instance[count.index]
   target_id	    = element(aws_instance.jenkins.*.id, count.index)
  port             = 8080
}