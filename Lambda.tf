# data "archive_file" "lambda" {
#   type        = "zip"
#   source_file = "Lambda.py"
#   output_path = "Lambda.zip"
# }

# resource "aws_lambda_function" "chatbot_lambda" {
#   function_name = "chatbot_lambda"
#   role          = aws_iam_role.iam_chatbotuser.arn
#   handler       = "Lambda.lambda_handler" 
#   source_code_hash = filebase64sha256("Lambda.zip")
#   filename         = "Lambda.zip"
#   runtime          = "python3.8" # Ensure you are using the correct python version

  
# }
