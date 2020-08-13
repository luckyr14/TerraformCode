variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "stg"
}

variable "function_name" {
  default = "stg_apollo_construct_auto_scheduling"
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

variable "subnets" {
  type = list
    default = ["subnet-0cf54241057a90cef", "subnet-0da59dbed859ff69b", "subnet-01883476659580454"]
}

variable "security_groups" {
  type = list
    default = ["sg-0f52d24d139c9fe54"]
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