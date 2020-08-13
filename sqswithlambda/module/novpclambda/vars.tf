variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "stg"
}

variable "function_name" {
  default = "null"
}

variable "lambda_role_arn" {
  default = "arn:aws:iam::422626387421:role/sqswithvpc"
}

variable "handler" {
  default = "Script.start_the_process"
}

variable "memory_size" {
  type    = number
  default = 3008
}

variable "runtime" {
  default = "python2.7"
}

variable "timeout" {
  type    = number
  default = 900
}

variable "filenamelocation" {
  default = "demo.zip"
}


variable "lambda_env" {
  type = map
  default = {
      foo = "bar"
      user = "Alice"
  }
}

variable "source_arn" {
default = "null"
}