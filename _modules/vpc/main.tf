#New VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(
    tomap({
      "Name" = "vpc-${var.env}"
    }), var.tags
  )
}

#Set up flow logs
resource "aws_flow_log" "vpc-flow-logs" {
  log_destination      = "${var.vpc-flow-logs}/"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc.id
}


#Public subnet 1
resource "aws_subnet" "subnet_public1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-public1
  availability_zone = var.az1
  tags = merge(
    tomap({
      "Name" = "subnet_public1"
    }), var.tags
  )
}

#Public subnet 2
resource "aws_subnet" "subnet_public2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-public2
  availability_zone = var.az2
  tags = merge(
    tomap({
      "Name" = "subnet_public2"
    }), var.tags
  )
}

#Public subnet 3
resource "aws_subnet" "subnet_public3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-public3
  availability_zone = var.az3
  tags = merge(
    tomap({
      "Name" = "subnet_public3"
    }), var.tags
  )
}

#Private subnet 1
resource "aws_subnet" "subnet_private1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-private1
  availability_zone = var.az1
  tags = merge(
    tomap({
      "Name" = "subnet_private1"
    }), var.tags
  )
}

#Private subnet 2
resource "aws_subnet" "subnet_private2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-private2
  availability_zone = var.az2
  tags = merge(
    tomap({
      "Name" = "subnet_private2"
    }), var.tags
  )
}

#Private subnet 3
resource "aws_subnet" "subnet_private3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-private3
  availability_zone = var.az3
  tags = merge(
    tomap({
      "Name" = "subnet_private3"
    }), var.tags
  )
}

#PrivMgmt subnet 1
resource "aws_subnet" "subnet_mgmt1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-mgmt1
  availability_zone = var.az1
  tags = merge(
    tomap({
      "Name" = "subnet_mgmt1"
    }), var.tags
  )
}

#PrivMgmt subnet 2
resource "aws_subnet" "subnet_mgmt2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-mgmt2
  availability_zone = var.az2
  tags = merge(
    tomap({
      "Name" = "subnet_mgmt2"
    }), var.tags
  )
}

#PrivMgmt subnet 1
resource "aws_subnet" "subnet_mgmt3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_cidr-mgmt3
  availability_zone = var.az3
  tags = merge(
    tomap({
      "Name" = "subnet_mgmt3"
    }), var.tags
  )
}

#New Internet Gateway for VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      "Name" = "igw_${var.env}"
    }), var.tags
  )
}

#Private Route Table 1
resource "aws_route_table" "prt1" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      "Name" = "prt1"
    }), var.tags
  )
}

#Private Route Table 2
resource "aws_route_table" "prt2" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      "Name" = "prt2"
    }), var.tags
  )
}

#Private Route Table 3
resource "aws_route_table" "prt3" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      "Name" = "prt3"
    }), var.tags
  )
}

#Public Route Table
resource "aws_route_table" "pubrt" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    tomap({
      "Name" = "pubrt1"
    }), var.tags
  )
}


#New EIP for NAT Gateway 1
resource "aws_eip" "eip_nat-private1" {
  count      = var.enable_nat == "Enabled" ? 1 : 0
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = merge(
    tomap({
      "Name" = "eip_nat-private1"
    }), var.tags
  )
}

#New EIP for NAT Gateway 2
resource "aws_eip" "eip_nat-private2" {
  count      = var.enable_nat == "Enabled" ? 1 : 0
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = merge(
    tomap({
      "Name" = "eip_nat-private2"
    }), var.tags
  )
}

#New EIP for NAT Gateway 3
resource "aws_eip" "eip_nat-private3" {
  count      = var.enable_nat == "Enabled" ? 1 : 0
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = merge(
    tomap({
      "Name" = "eip_nat-private3"
    }), var.tags
  )
}

#New NAT for Private Subnet 1
resource "aws_nat_gateway" "nat_private1" {
  count         = var.enable_nat == "Enabled" ? 1 : 0
  allocation_id = aws_eip.eip_nat-private1[0].id
  subnet_id     = aws_subnet.subnet_public1.id
  depends_on    = [aws_internet_gateway.igw]
  tags = merge(
    tomap({
      "Name" = "nat_private1"
    }), var.tags
  )
}

#New NAT for Private Subnet 2
resource "aws_nat_gateway" "nat_private2" {
  count         = var.enable_nat == "Enabled" ? 1 : 0
  allocation_id = aws_eip.eip_nat-private2[0].id
  subnet_id     = aws_subnet.subnet_public2.id
  depends_on    = [aws_internet_gateway.igw]
  tags = merge(
    tomap({
      "Name" = "nat_private2"
    }), var.tags
  )
}

#New NAT for Private Subnet 3
resource "aws_nat_gateway" "nat_private3" {
  count         = var.enable_nat == "Enabled" ? 1 : 0
  allocation_id = aws_eip.eip_nat-private3[0].id
  subnet_id     = aws_subnet.subnet_public3.id
  depends_on    = [aws_internet_gateway.igw]
  tags = merge(
    tomap({
      "Name" = "nat_private3"
    }), var.tags
  )
}


#Associate Public Subnet 1 to public route table
resource "aws_route_table_association" "pubrta_public1" {
  subnet_id      = aws_subnet.subnet_public1.id
  route_table_id = aws_route_table.pubrt.id
}

#Associate Public Subnet 2 to public route table
resource "aws_route_table_association" "pubrta_public2" {
  subnet_id      = aws_subnet.subnet_public2.id
  route_table_id = aws_route_table.pubrt.id
}

#Associate Public Subnet 3 to public route table
resource "aws_route_table_association" "pubrta_public3" {
  subnet_id      = aws_subnet.subnet_public3.id
  route_table_id = aws_route_table.pubrt.id
}

#Associate Private Subnet 1 to private route table
resource "aws_route_table_association" "prta_private1" {
  subnet_id      = aws_subnet.subnet_private1.id
  route_table_id = aws_route_table.prt1.id
}

#Associate Private Subnet 2 to private route table
resource "aws_route_table_association" "prta_private2" {
  subnet_id      = aws_subnet.subnet_private2.id
  route_table_id = aws_route_table.prt2.id
}

#Associate Private Subnet 3 to private route table
resource "aws_route_table_association" "prta_private3" {
  subnet_id      = aws_subnet.subnet_private3.id
  route_table_id = aws_route_table.prt3.id
}

#Associate Private Subnet 1 to mgmt route table
resource "aws_route_table_association" "prta_mgmt1" {
  subnet_id      = aws_subnet.subnet_mgmt1.id
  route_table_id = aws_route_table.prt1.id
}

#Associate Private Subnet 2 to mgmt route table
resource "aws_route_table_association" "prta_mgmt2" {
  subnet_id      = aws_subnet.subnet_mgmt2.id
  route_table_id = aws_route_table.prt2.id
}

#Associate Private Subnet 3 to mgmt route table
resource "aws_route_table_association" "prta_mgmt3" {
  subnet_id      = aws_subnet.subnet_mgmt3.id
  route_table_id = aws_route_table.prt3.id
}

#Set up open nACL for vpc
resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [
    aws_subnet.subnet_public1.id,
    aws_subnet.subnet_public2.id,
    aws_subnet.subnet_public3.id,
    aws_subnet.subnet_private1.id,
    aws_subnet.subnet_private2.id,
    aws_subnet.subnet_private3.id,
    aws_subnet.subnet_mgmt1.id,
    aws_subnet.subnet_mgmt2.id,
    aws_subnet.subnet_mgmt3.id
  ]
  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = merge(
    tomap({
      "Name" = "nacl_${var.env}"
    }), var.tags
  )
}


#Set up VPC endpoint for private subnets to S3
resource "aws_vpc_endpoint" "vpce_s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = [
    aws_route_table.pubrt.id,
    aws_route_table.prt1.id,
    aws_route_table.prt2.id,
    aws_route_table.prt3.id,
  ]
  policy = <<POLICY
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
}


#Set up VPC endpoint for private subnets to dynamodb
resource "aws_vpc_endpoint" "vpce_ddb" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.dynamodb"
  route_table_ids = [
    aws_route_table.pubrt.id,
    aws_route_table.prt1.id,
    aws_route_table.prt2.id,
    aws_route_table.prt3.id,
  ]
  policy = <<POLICY
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
}
