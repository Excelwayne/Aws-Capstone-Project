resource "aws_cloudwatch_log_group" "chatbot_logs" {
  name              = "/aws/lambda/your_chatbot_lambda_function"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_stream" "chatbot_log_stream" {
  name           = "your_chatbot_log_stream"
  log_group_name = aws_cloudwatch_log_group.chatbot_logs.name
}

resource "aws_cloudwatch_metric_alarm" "chatbot_metric_alarm" {
  alarm_name          = "your_chatbot_metric_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "your_metric_name"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "SampleCount"
  threshold           = 1
  alarm_description   = "Alarm for your chatbot metric"
  alarm_actions       = [aws_sns_topic.chatbot_alerts.arn]
}

resource "aws_sns_topic" "chatbot_alerts" {
  name = "your_chatbot_alerts"
}

# resource "aws_lambda_permission" "chatbot_cloudwatch_logs" {
#   statement_id  = "AllowExecutionFromCloudWatchLogs"
#   action        = "lambda:InvokeFunction"
#   function_name = "your_chatbot_lambda_function"
#   principal     = "logs.amazonaws.com"

#   source_arn = aws_cloudwatch_log_group.chatbot_logs.arn
# }

# resource "aws_cloudwatch_metric_alarm" "ec2_metric_alarm" {
#   alarm_name          = "your_ec2_metric_alarm"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = 1
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = 300
#   statistic           = "Average"
#   threshold           = 70
#   alarm_description   = "Alarm for high EC2 CPU utilization"
#   alarm_actions       = [aws_sns_topic.ec2_alerts.arn]

#   dimensions = {
#     InstanceId = aws_instance.my_instance.id
#   }
# }

# resource "aws_sns_topic" "ec2_alerts" {
#   name = "chatbot_ec2_alerts"
# }

# resource "aws_cloudwatch_metric_alarm" "lambda_metric_alarm" {
#   alarm_name          = "chatbot_lambda_metric_alarm"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = 1
#   metric_name         = "Invocations"
#   namespace           = "AWS/Lambda"
#   period              = 60
#   statistic           = "Sum"
#   threshold           = 100
#   alarm_description   = "Alarm for high Lambda invocations"
#   alarm_actions       = [aws_sns_topic.lambda_alerts.arn]

#   dimensions = {
#     FunctionName = aws_lambda_function.chatbot_lambda.function_name
#   }
# }

# resource "aws_sns_topic" "lambda_alerts" {
#   name = "lambda_alerts"
# }

resource "aws_cloudwatch_metric_alarm" "dynamodb_metric_alarm" {
  alarm_name          = "dynamodb_metric_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ConsumedReadCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = 300
  statistic           = "Sum"
  threshold           = 1000
  alarm_description   = "Alarm for high DynamoDB read capacity units"
  alarm_actions       = [aws_sns_topic.dynamodb_alerts.arn]

  dimensions = {
    TableName = aws_dynamodb_table.my_table.name
  }
}

resource "aws_sns_topic" "dynamodb_alerts" {
  name = "your_dynamodb_alerts"
}
