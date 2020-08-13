terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/budgeting"
	region = "us-east-1"
   }
}
