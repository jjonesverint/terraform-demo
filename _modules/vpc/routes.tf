# -------------------------
# Basic Routes
# -------------------------
resource "aws_route" "pubrt_igw" {
  route_table_id         = aws_route_table.pubrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


resource "aws_route" "prt1_nat" {
  count                  = var.enable_nat == "Enabled" ? 1 : 0
  route_table_id         = aws_route_table.prt1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_private1[0].id
}

resource "aws_route" "prt2_nat" {
  count                  = var.enable_nat == "Enabled" ? 1 : 0
  route_table_id         = aws_route_table.prt2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_private2[0].id
}

resource "aws_route" "prt3_nat" {
  count                  = var.enable_nat == "Enabled" ? 1 : 0
  route_table_id         = aws_route_table.prt3.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_private3[0].id
}
