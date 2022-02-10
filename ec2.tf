resource "aws_instance" "app_server" {
  ami           = "ami-0cd73cc497a2d6e69"
  provider = aws.account1
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.test_profile.id
  vpc_security_group_ids = [aws_security_group.ass_test_sg.id]
  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "ass_test_sg" {
  name        = "AssessmentTestSG"
  provider = aws.account1
  description = "AssessmentTest Security Group"
  vpc_id      = aws_vpc.vpc_test.id 


  ingress {
    
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

