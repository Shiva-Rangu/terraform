/*
This configuration will create 5 EC2 instances
on AWS provider
*/
resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18" #Ubuntu 22.04 LTS Free Tier Image
  instance_type = "t2.micro"
  key_name      = "terraform-demo"
  user_data     = file("nginx-install.sh")
  count         = 2
  #availability_zone = "us-east-1a"

  tags = {
    "Name" = "Nginx-${count.index}"
  }
}
