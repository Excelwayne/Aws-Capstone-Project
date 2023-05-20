# Create a new EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0889a44b331db0194"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.chatbot_subnet[0].id
  vpc_security_group_ids = [aws_security_group.my_sg.id]


  # User data to install necessary software and start services
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y python3
              sudo yum install -y awscli
              aws configure set region us-west-2
              EOF

  # Attach IAM role to the instance
  # iam_instance_profile = var.iam_role_name

  # Connect to CloudWatch and DynamoDB
  depends_on = [
    aws_cloudwatch_log_group.my_log_group,
    aws_dynamodb_table.my_table
  ]

  # Add tags to the EC2 instance
  tags = {
    Name = "my_instance"
  }
}

# Create a new CloudWatch log group
resource "aws_cloudwatch_log_group" "my_log_group" {
  name = "/aws/lambda/my_function"
}

# Create a new DynamoDB table

resource "aws_dynamodb_table" "my_table" {
  name           = "my_table"
  hash_key       = "chatbot-id"
  attribute {
    name = "chatbot-id"
    type = "S"
  }
  
  read_capacity  = 5
  write_capacity = 5
}
  


# Create a security group for the instance
resource "aws_security_group" "my_sg" {
  name_prefix = "my-security-group"
  description = "Allow all incoming traffic"
  vpc_id      = aws_vpc.chatbot_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-security-group"
  }
}