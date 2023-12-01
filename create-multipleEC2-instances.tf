provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "ap-southeast-2"
}

resource "aws_instance" "linux" {
  tags = {
    Name = "SUSE_linux-instance"
  }
  ami           = "ami-05f022a94efa28736"
  instance_type = "t2.nano"
  count         = 5
  key_name      = "terraform-sydney"
}
