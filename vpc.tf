data "aws_availability_zones" "available" {
  provider = aws.account1
  state = "available"
  filter {
    name   = "region-name"
    values = ["${var.aws_region}"]
  }
}
resource "aws_vpc" "vpc_test" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  provider = aws.account1
  tags = {
    Name = "Assessment Test - VPC"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_test.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  provider = aws.account1
  tags = {
    Name = "Assessment Test - Private Subnet"
  }
}

resource "aws_vpc_endpoint" "ssm_endpoint_test" {
  vpc_id            = aws_vpc.vpc_test.id
  provider = aws.account1
  service_name      = "com.amazonaws.${var.aws_region}.ssm"
  vpc_endpoint_type = "Interface"
  tags = {
    Name = "ssm_endpoint_test"
  }
  subnet_ids = [
    aws_subnet.private_subnet.id
  ]
  security_group_ids = [
    aws_security_group.ass_test_sg.id,
  ]

  private_dns_enabled = true
}



resource "aws_vpc_endpoint" "ssm_messages_endpoint_test" {
  vpc_id            = aws_vpc.vpc_test.id
  provider = aws.account1
  service_name      = "com.amazonaws.${var.aws_region}.ssmmessages"
  vpc_endpoint_type = "Interface"
  tags = {
    Name = "ssm_messages_endpoint_test"
  }
  subnet_ids = [
    aws_subnet.private_subnet.id
  ]
  security_group_ids = [
    aws_security_group.ass_test_sg.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_messages_endpoint_test" {
  vpc_id            = aws_vpc.vpc_test.id
  provider = aws.account1
  service_name      = "com.amazonaws.${var.aws_region}.ec2messages"
  vpc_endpoint_type = "Interface"
  tags = {
    Name = "ec2_messages_endpoint_test"
  }
  subnet_ids = [
    aws_subnet.private_subnet.id
  ]
  security_group_ids = [
    aws_security_group.ass_test_sg.id,
  ]

  private_dns_enabled = true
}

resource "aws_route_table" "test_route" {
  vpc_id = aws_vpc.vpc_test.id
  provider = aws.account1
  

  

  tags = {
    Name = "test route"
  }
}

resource "aws_default_route_table" "default_route" {
  provider = aws.account1
  default_route_table_id = aws_vpc.vpc_test.default_route_table_id

}

resource "aws_vpc_endpoint" "s3_endpoint_test" {
  vpc_id            = aws_vpc.vpc_test.id
  provider = aws.account1
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [aws_default_route_table.default_route.default_route_table_id]
  tags = {
    Name = "s3_endpoint_test"
  }
 
 

  
}


