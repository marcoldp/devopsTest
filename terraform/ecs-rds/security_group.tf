// # A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. 
resource "aws_security_group" "ec2" {
    vpc_id      = aws_vpc.main.id
    #http port for container
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #https
    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    egress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    # for ssh
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "rds" {
    vpc_id      = aws_vpc.main.id
    #default port for database
    ingress {
        protocol        = "tcp"
        from_port       = 3306
        to_port         = 3306
        cidr_blocks     = ["0.0.0.0/0"]
        # Inbound traffic is also allowed from ECS security group, which means that the application that will live on EC2 in the cluster will have permission to use MySQL
        security_groups = [aws_security_group.ec2.id]
    }
}