variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "stg"
}

variable "sqsname" {
  default = "stg_apollo_construct_auto_scheduling"
}

variable "visibility_timeout_seconds" {
  type    = number
  default = 901
}

variable "message_retention_seconds" {
  type    = number
  default = 345600
}

variable "max_message_size" {
  type    = number
  default = 262144
}

variable "delay_seconds" {
  type    = number
  default = 0
}

variable "receive_wait_time_seconds" {
  type    = number
  default = 2
}

variable "sqsmaxReceiveCount" {
  type    = number
  default = 1
}

variable "dlqname" {
  default = "stg_apollo_construct_auto_scheduling_dlq"
}

variable "dlq_visibility_timeout_seconds" {
  type    = number
  default = 30
}

variable "dlq_message_retention_seconds" {
  type    = number
  default = 1209600
}

variable "dlq_max_message_size" {
  type    = number
  default = 262144
}

variable "dlq_delay_seconds" {
  type    = number
  default = 0
}

variable "dlq_receive_wait_time_seconds" {
  type    = number
  default = 0
}