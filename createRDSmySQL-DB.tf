provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "us-east-2"
}
#creating Relational Database Service (RDS)
resource "aws_db_instance" "myrds" {
  engine              = "mysql"
  engine_version      = "8.0.32"
  allocated_storage   = 20            # how much space you would like in GB
  instance_class      = "db.t3.micro" # like instance_type
  storage_type        = "gp2"
  identifier          = "mydb" # like a name
  username            = "admin"
  password            = "adminADMINadmin"
  publicly_accessible = false # optinal since its by default private
  skip_final_snapshot = true  # not to take any backup
  tags = {
    Name = "MySQL_DB"
  }
}
