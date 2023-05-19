# Aws-Capstone-Project

# Chatbot Project

## Overview
This project implements a chatbot using AWS Lex and Lambda. The chatbot is designed to assist users in booking hotel rooms. It provides a conversational interface for users to specify their booking preferences and receive confirmation or rejection messages. It is built using Amazon Lex for natural Language understanding, AWS Lambda for backend processing also DynamoDB to store and manage the hotelbooking data and cloudwatch for monitoring and logging. The Chatbot leverages Terraform as an infrastructure-as-code tool for provisioning and managing the AWS resources required for the chatbot deployment

## Features
* User-Friendly Interface: The chatbot uses a natural language interface, enabling users to interact conversationally for hotel bookings
* Intent Recognition: The Chatbot recognizes user intents such as greeting, hotel booking requests and cancelling a reservation
* Slot Elicitation: That Chatbot prompts users to provide specific information such as Location, Check-in-date, room type and number of nights
* Integration with Lambda: AWS Lambda functions are used for the fulfillment activities of the chatbot, handling booking logic and data processing.
* CloudWatch Monitoring: CloudWatch provides real-time monitoring of Lambda functions, ensuring efficient and smooth operation
* Integration wuth EC2: The chatbot utilizes an EC2 instance to host backend services that support the chatbot functionality and it can be configured for auto scaling to handle fluctuating workload, thereby providing scalability 

![chatbot](https://github.com/Excelwayne/Aws-Capstone-Project/assets/94924696/fee67499-b957-4d22-b314-b1cd0f64cce8)
