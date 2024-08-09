# Create EC2 Key Pair
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = tls_public_key.key.public_key_openssh
}

# Create a TLS key pair to generate a public/private key pair
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_public_key" "key" {
  algorithm = tls_private_key.key.algorithm
  public_key_openssh = tls_private_key.key.public_key_openssh
}

# Store the private key in AWS Secrets Manager
resource "aws_secretsmanager_secret" "key_pair_secret" {
  name        = var.key_name
  description = "EC2 private key for the key pair"
}

resource "aws_secretsmanager_secret_version" "key_pair_secret_version" {
  secret_id     = aws_secretsmanager_secret.key_pair_secret.id
  secret_string = tls_private_key.key.private_key_pem
}
