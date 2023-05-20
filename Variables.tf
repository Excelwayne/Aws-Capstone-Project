# variable "bot_name" {
#   default = "HotelBookingBot"
# }

# variable "bot_description" {
#   default = "A chatbot for hotel booking"
# }

# variable "bot_locale" {
#   default = "en_GB"
# }

# variable "intent_names" {
#   default = [
#     "Greeting",
#     "Booking",
#     "CheckAvailability",
#     "RoomType",
#     "Location",
#     "Confirmation",
#     "Cancellation",
#   ]
# }

# variable "bot_alias" {
#     default = "Ruby"
  
# }

variable "name_prefix" {
  type        = string
  description = "Prefix name to apply to all resources"

  default = "chatbot"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = list(string)
  description = "CIDR block for subnets"
  default = [ "10.0.0.0/24" ]
}

variable "aws_region" {
  description = "AWS region" 
  default = "us-east-1"
}


variable "iam_role_name" {
  description = "The name of the IAM role to attach to the EC2 instance"
  type        = string
   
}

variable "vpc_name" {
  type    = string
  default = "chatbotvpc"
}

variable "availability_zone" {
  description = "Availability Zone in us-east-1 region"
  default     = "us-east-1a"
}
variable "instance_type" {
  description = "type of instance"
  default = "t3.micro"
  
}

variable "location_slot" {
  default = "Location"
}

variable "check_in_date_slot" {
  default = "CheckInDate"
}

variable "nights_slot" {
  default = "Nights"
}

variable "room_type_slot" {
  default = "RoomType"
}

variable "bot_name" {
    default = "HotelBookingBot"
  
}

variable "bot_alias" {
    default = "Ruby"
  
}

variable "bot_description" {
  description = "The description of the bot"
  type        = string
  default     = "Hotel booking chatbot" 
}

variable "bot_locale" {
  description = "The locale of the bot"
  type        = string
  default     = "en-GB"
}

