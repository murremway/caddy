resource "aws_security_group" "caddy_sg" {
	name = "caddy"
	description = "EC2 SG"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

  	ingress {
		from_port = 3001
		to_port = 3001
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

    ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	#Allow all outbound
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
tags = {
    Name = "caddy"
  }
}
