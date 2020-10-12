provider "aws" {
  profile = "default"
  region  = "us-east-2"
}
terraform {
    backend "s3" {
        bucket = "Wek_2-del-devops-bucket"
        key    = "devops_key"
        region = "us-east-2"
    }
}

resource "aws_instance" "nginix_instance" {
  ami                    = "ami-03657b56516ab7912"
  instance_type          = "t2.micro"
  key_name               = "devops_key"
  vpc_security_group_ids = [aws_security_group.nginix_mid.id]
  user_data = "${file("install_nginix.sh")}" 

  tags = {
    Name        = "nginix_machine"
    Provisioner = "Terraform"
    Test        = "yes_no"
  }
}
resource "aws_instance" "tomcat_instance" {
  ami                    = "ami-03657b56516ab7912"
  instance_type          = "t2.micro"
  key_name               = "devops_key"
  vpc_security_group_ids = [aws_security_group.tomcat_mid.id]
  user_data = "${file("install_tomcat.sh")}"

  tags = {
    Name        = "tomcat_machine"
    Provisioner = "Terraform"
  }
}
