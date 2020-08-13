terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/construct"
	region = "us-east-1"
   }
}
