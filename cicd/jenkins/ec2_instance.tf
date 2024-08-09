resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2_key_pair.key_name 
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = var.instance_name
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.iam_role.name
}

resource "aws_iam_role" "iam_role" {
  name               = var.iam_role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iam-policy" {
  role = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}