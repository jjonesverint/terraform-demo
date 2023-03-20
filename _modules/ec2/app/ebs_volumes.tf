resource "aws_ebs_volume" "ebs_e" {
  count             = var.ebs_e != 0 ? 1 : 0
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id
  availability_zone = aws_instance.server.availability_zone
  size              = var.ebs_e
  type              = var.ebs_type
  lifecycle {
    ignore_changes = [
      size
    ]
  }
  tags = merge(
    tomap({
      "Name"= var.server_name,
    }), var.tags
  )
}

resource "aws_volume_attachment" "ebsa_e" {
  count       = var.ebs_e != 0 ? 1 : 0
  device_name = "xvde"
  volume_id   = aws_ebs_volume.ebs_e[0].id
  instance_id = aws_instance.server.id
}

resource "aws_ebs_volume" "ebs_k" {
  count             = var.ebs_k != 0 ? 1 : 0
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id
  availability_zone = aws_instance.server.availability_zone
  size              = var.ebs_k
  type              = var.ebs_type
  lifecycle {
    ignore_changes = [
      size
    ]
  }
  tags = merge(
    tomap({
      "Name"= var.server_name,
    }), var.tags
  )
}

resource "aws_volume_attachment" "ebsa_k" {
  count       = var.ebs_k != 0 ? 1 : 0
  device_name = "xvdk"
  volume_id   = aws_ebs_volume.ebs_k[0].id
  instance_id = aws_instance.server.id
}
