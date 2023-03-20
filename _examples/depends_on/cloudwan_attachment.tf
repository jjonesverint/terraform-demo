# Cloudwan variables 
variable "core_network_id" {
  default = "core-network-123456789ascbv"
}

variable "core_network_arn" {
  default = "arn:aws:networkmanager::12345678901234:core-network/core-network-123456789ascbv"
}

# attach vpc to core network
resource "awscc_networkmanager_vpc_attachment" "attach_corenetwork" {
  core_network_id = var.core_network_id
  vpc_arn         = module.vpc.vpc_arn
  subnet_arns = [
    module.vpc.subnet_mgmt1_arn,
    module.vpc.subnet_mgmt2_arn
  ]
}

# adds a route pointing a Prefix list at Cloudwan - but waits until the Cloudwan attachment exists
resource "aws_route" "mgmt1" {
  route_table_id             = module.vpc.pubrt
  destination_prefix_list_id = data.aws_ec2_managed_prefix_list.example.id
  core_network_arn           = var.core_network_arn
  
  depends_on = [
    awscc_networkmanager_vpc_attachment.attach_corenetwork
  ]

}