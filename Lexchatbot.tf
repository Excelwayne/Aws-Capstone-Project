resource "aws_lex_bot" "HotelBookingBot" {
  name        = var.bot_name
  description = var.bot_description
  locale      = var.bot_locale

  enable_model_improvements = true

  idle_session_ttl_in_seconds = 300

  clarification_prompt {
    max_attempts = 2

    message {
      content      = "I'm not sure what you mean. Can you please rephrase?"
      content_type = "PlainText"
    }
  }

  abort_statement {
    message {
      content      = "Sorry, I'm not able to help with your request."
      content_type = "PlainText"
    }
  }

  child_directed = false
  create_version = false

  intent {
    intent_name    = aws_lex_intent.greeting_intent.name
    intent_version = aws_lex_intent.greeting_intent.version
  }
}

resource "aws_lex_intent" "greeting_intent" {
  name = "${var.bot_name}_greeting_intent"

  sample_utterances = [
    "Good morning",
    "Hi there",
    "Hello",
    "Hey",
  ]

  conclusion_statement {
    message {
      content_type = "PlainText"
      content = "Hi, I'm ${var.bot_name}, the ${var.bot_description} Bot. How can I assist you today?"
    }
  }

  fulfillment_activity {
    type = "ReturnIntent"
  }
}

resource "aws_lex_intent" "book_hotel" {
  name = "${var.bot_name}_book_hotel"

  sample_utterances = [ 
    "I want to book a hotel",
    "Can you help me book a hotel",
    "I need a hotel room",
    "Book a hotel for me",
    "Book a {Nights} night stay in {Location}"
  ]
   

  slot {
    name              = var.location_slot
    description       = "Location of the hotel"
    slot_type         = "AMAZON.US_CITY"
    slot_constraint   = "Required"


    value_elicitation_prompt {
      max_attempts = 2
      message {
        content      = "What city would you like to book a hotel in?"
        content_type = "PlainText"
      }
    }
  }

  slot {
    name              = var.check_in_date_slot
    description       = "Check in Date of the booking"
    slot_type         = "AMAZON.DATE"
    slot_constraint   = "Required"

    value_elicitation_prompt {
      max_attempts = 2

      message {
        content      = "What date do you want to check in?"
        content_type = "PlainText"
      }
    }
  }

  slot {
    name              = var.nights_slot
    description       = "Number of Nights for booking"
    slot_type         = "AMAZON.NUMBER"
    slot_constraint   = "Required"

    value_elicitation_prompt {
      max_attempts = 2

      message {
        content      = "How many nights do you want to stay?"
        content_type = "PlainText"
      }
    }
  }

  slot {
    name              = var.room_type_slot
    description       = "Type of Room to be booked"
    slot_type         = "AMAZON.RoomType"
    slot_constraint   = "Required"

    value_elicitation_prompt {
      max_attempts = 2

      message {
        content      = "What type of room would you like to book?"
        content_type = "PlainText"
      }
    }
  }

  confirmation_prompt {
    max_attempts = 2
    message {
      content      = "Okay, I have you down for a {RoomType} room in {Location} for {Nights} nights starting on {CheckInDate}. Is that correct?"
      content_type = "PlainText"
    }
  }

  rejection_statement {
    message {
      content      = "Okay, I have cancelled your reservation."
      content_type = "PlainText"
    }
  }

  fulfillment_activity {
    type = "CodeHook"

    code_hook {
        uri = "arn:aws:lambda:us-east-1:173161532165:function:Chatbot"
        message_version = "1.0"
      
    }
  }
}


## Output the bot's ARN
output "bot_arn" {
  value = aws_lex_bot.HotelBookingBot.arn
}
