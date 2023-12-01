provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "ap-southeast-2"
}
resource "aws_instance" "Linux" {
  tags = {
    Name = "my-linux-instance"
  }
  ami           = "ami-0361bbf2b99f46c1d"
  instance_type = "t2.micro"
  key_name      = "terraform-sydney"
}
resource "aws_security_group" "allow_ssh" {
  tags= {
    Name = "Allow_SSH"
  }
  name        = "allow_ssh"
  description = "allow ssh traffic"
  ingress {
    from_port   = 22 # bydefault, the linux server listens on TCP port 22 for SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
