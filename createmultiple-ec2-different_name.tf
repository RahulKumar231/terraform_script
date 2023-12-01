provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "us-east-2"
}
variable "different_name" {
  type    = list(any)
  default = ["webserver", "test-webserver", "stage-webserver", "pro-webserver", "db-server"]
}
resource "aws_instance" "multiple" {
  ami = "ami-06d4b7182ac3480fa"
  tags = {
    Name = var.different_name[count.index]
  }
  instance_type   = "t2.micro"
  count           = 5
  key_name        = "terraform-ohio"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}
resource "aws_security_group" "allow_ssh" {
  tags = {
    Name = "Allow_SSH"
  }
  description = "Allow SSH traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}





