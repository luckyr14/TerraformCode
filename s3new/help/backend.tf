terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/help"
	region = "us-east-1"
   }
}
