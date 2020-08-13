variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "bucketname" {
  default = "stage-web-apollo-client"
}

variable "s3resource" {
  default = "arn:aws:s3:::dev-account-apollo-client/*"
}

variable "s3backendbucket" {
  default = "terraform-eks-apollo-state"
}

variable "s3backendbucketkey" {
  default = "devclient/help"
}

variable "s3backendbucketregion" {
  default = "us-east-1"
}