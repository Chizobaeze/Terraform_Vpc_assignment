resource "aws_vpc" "eze" {
  cidr_block       = "192.168.0.0/16"
  

  tags = {
    Name = "chizoba_eze"
    Team = "pain or out"
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id     = aws_vpc.eze.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "Public_Subnet"
  }
}

resource "aws_subnet" "Private_Subnet" {
  vpc_id     = aws_vpc.eze.id
  cidr_block = "192.168.4.0/24"

  tags = {
    Name = "Private_Subnet"
  }
}


resource "aws_internet_gateway" "internet-gate" {
  vpc_id = aws_vpc.eze.id

  tags = {
    Name = "igway"
  }
}

resource "aws_route_table" "ciz-route" {
  vpc_id = aws_vpc.eze.id

  
  tags = {
    Name = "ciz-route"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gate.id
  }
}

resource "aws_route_table_association" "ciz-route-a" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.ciz-route.id
}


resource "aws_security_group" "ciz-secure" {
  name        = "ciz-secure"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.eze.id

  tags = {
    Name = "ciz-secure"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ciz-secure" {
  security_group_id = aws_security_group.ciz-secure.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "ciz-secure" {
  security_group_id = aws_security_group.ciz-secure.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}