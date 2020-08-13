terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/webapollo"
	region = "us-east-1"
   }
}
