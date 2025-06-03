# Internetgateway to enable traffic from internet

resource "aws_internet_gateway" "codegithubaction-iw" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "main-IG"
  }
}


# Public Route table 

resource "aws_route_table" "coderoutegithubaction-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.codegithubaction-iw.id
  }
  tags = {
    Name = "public-route"
  }
}

# Associcate public subnet to 

resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.coderoutegithubaction-route.id
}




