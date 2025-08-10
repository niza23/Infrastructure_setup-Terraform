resource "aws_instance" "web1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = base64encode(file("userdata1.sh"))

  lifecycle {
    ignore_changes = [tags]
  }

  tags = merge(local.common_tags, { Name = "Web-Server-1" })
}

resource "aws_instance" "web2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[1].id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = base64encode(file("userdata2.sh"))

  lifecycle {
    ignore_changes = [tags]
  }

  tags = merge(local.common_tags, { Name = "Web-Server-2" })
}
