terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/scheduler"
	region = "us-east-1"
   }
}
