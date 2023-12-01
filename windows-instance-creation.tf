provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "ap-northeast-1"
}
# creating one computer means resource

resource "aws_instance" "windows" {
  ami = "ami-0ad71230122734dd0"
  tags = {
    Name = "my-windows-computer"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-tokyo"
}






