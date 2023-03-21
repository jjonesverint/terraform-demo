data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "example" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t3.micro"
  subnet_id               = data.terraform_remote_state.vpc.outputs.subnet1
  disable_api_termination = false
  ebs_optimized           = true
  source_dest_check       = false
  vpc_security_group_ids  = [data.terraform_remote_state.vpc.outputs.sg_id]
  user_data               = ""

  tags = merge(
    local.common_tags,
    {
      "Name" = "Example-Server-${random_string.random.result}"
    },
  )
  volume_tags = merge(
    local.common_tags,
    {
      "Name" = "Example-Server-${random_string.random.result}"
    },
  )

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "60"
    delete_on_termination = true
  }
}