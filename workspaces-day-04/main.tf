
resource "aws_instance" "web-app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  

  tags = {
    Name = "my-name-rohit"
  }
}
