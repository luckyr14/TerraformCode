resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.sqsname
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    maxReceiveCount     = var.sqsmaxReceiveCount
  })

  tags = {
    Environment = var.env
  }
}


resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name                      = var.dlqname
  visibility_timeout_seconds  = var.dlq_visibility_timeout_seconds
  message_retention_seconds   = var.dlq_message_retention_seconds
  max_message_size            = var.dlq_max_message_size
  delay_seconds               = var.dlq_delay_seconds
  receive_wait_time_seconds   = var.dlq_receive_wait_time_seconds
  tags = {
    Environment = var.env
  }
}


output "sqs_arn" {
value = "${aws_sqs_queue.terraform_queue.arn}"
}

output "sqs_dlq_arn" {
value = "${aws_sqs_queue.terraform_queue_deadletter.arn}"
}
