terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/manage"
	region = "us-east-1"
   }
}
