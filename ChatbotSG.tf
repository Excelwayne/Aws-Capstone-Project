resource "aws_security_group" "chatbot_sg" {
  name_prefix = var.name_prefix
  vpc_id      = aws_vpc.chatbot_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-chatbot-sg"
  }
}

resource "aws_security_group" "lambda_sg" {
  name_prefix = var.name_prefix
  vpc_id      = aws_vpc.chatbot_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-lambda-sg"
  }
}

resource "aws_security_group" "dynamodb_sg" {
  name_prefix = var.name_prefix
  vpc_id      = aws_vpc.chatbot_vpc.id

 }
