# providers information
provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "ap-southeast-1"
}
# terraform code to spin up EC2 instance
resource "aws_instance" "linux" {
  tags = {
    Name = "My_Amazon_Linux"
  }
  ami             = "ami-02453f5468b897e31"
  instance_type   = "t2.micro"
  key_name        = "terraform-singapore"
security_groups = ["${aws_security_group.allow_ssh_http.name}"]

# userdata script to pass AWS EC2 instance by using terraform
  user_data = file("script.sh")
}
# creating security group
resource "aws_security_group" "allow_ssh_http" {
  tags = {
    Name = "Allow_SSH_HTTP"
  }
  name        = "allow_ssh_http"
  description = "Allow ssh and http"
  vpc_id      = "vpc-04c26e24c92033409" # we can write this vpc_id from default SG from AWS
  ingress {
    description      = "allow ssh from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # for IPv4
    ipv6_cidr_blocks = ["::/0"]      # for IPv6
  }
  ingress {
    description      = "allow http from vpc"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # for IPv4
    ipv6_cidr_blocks = ["::/0"]      # for IPv6
  }
  # opening all for outgoing
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # for IPv4
    ipv6_cidr_blocks = ["::/0"]      # for IPv6
  }
}
