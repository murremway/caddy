provider "aws" {

        access_key = "ACCESS KEY"
        secret_key  = "SECRET KEY"
        region         = "us-east-1"

}

resource "aws_instance" "caddy" {
    user_data   = base64encode(file("deploy.sh"))
    ami                                = "ami-083654bd07b5da81d"
    instance_type                      = "t2.micro"
    key_name                           = ""
    vpc_security_group_ids = [aws_security_group.caddy_sg.id]
    root_block_device {
    volume_type                     = "gp2"
    volume_size                     = 200
    delete_on_termination           = true
    encrypted                       = true
  }
  tags = {
    Name = "caddy"
  }

}

output "ec2_ip" {
    value = [aws_instance.caddy.*.private_ip]
}

output "ec2_ip_public" {
    value = [aws_instance.caddy.*.public_ip]
}

output "ec2_name" {
    value = [aws_instance.caddy.*.tags.Name]
}
