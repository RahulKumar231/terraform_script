provider "aws" {
profile = "terraform_user"
access_key = "AKIAX6IHJJN7IQGNP4GF"
secret_key = "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"
region = "ap-southeast-2"
}
resource "aws_instance" "linux" {
tags = {
Name= "My_Debian"
}
ami= "ami-08e168f4c7bff7921"
instance_type = "t2.micro"
key_name = "terraform-sydney"
security_groups=["${aws_security_group.allow_ssh.name}"]
}

resource "aws_security_group" "allow_ssh" {
tags = {
Name = "Allow_SSH"
}
name="allow_ssh"
description = "Allow ssh traffic"
ingress {
from_port= 22
to_port = 22
protocol ="tcp"
cidr_blocks=["0.0.0.0/0"]
}
}








