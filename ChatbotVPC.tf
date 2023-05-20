# Create a VPC
resource "aws_vpc" "chatbot_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_subnet" "chatbot_subnet" {
  count = length(var.subnet_cidr)
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = var.availability_zone
  vpc_id = aws_vpc.chatbot_vpc.id
  tags = {
    Name = "${var.name_prefix}-subnet-${count.index + 1}"
  }
}

