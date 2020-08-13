terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/insight"
	region = "us-east-1"
   }
}
