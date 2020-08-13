terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/estimate"
	region = "us-east-1"
   }
}
