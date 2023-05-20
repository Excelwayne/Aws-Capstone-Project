# Create an Internet Gateway and associate it with the VPC
resource "aws_internet_gateway" "chatbot_igw" {
  vpc_id = aws_vpc.chatbot_vpc.id
  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

# Create a Route Table and add a default route to the Internet Gateway
resource "aws_route_table" "chatbot_rt" {
  vpc_id = aws_vpc.chatbot_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.chatbot_igw.id
  }
  tags = {
    Name = "${var.name_prefix}-rt"
  }
}

# Associate the Route Table with the subnets
resource "aws_route_table_association" "chatbot_rta" {
  count          = length(aws_subnet.chatbot_subnet)
  subnet_id      = aws_subnet.chatbot_subnet[count.index].id
  route_table_id = aws_route_table.chatbot_rt.id
}
