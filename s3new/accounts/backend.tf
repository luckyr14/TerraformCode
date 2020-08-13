terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/accounts"
	region = "us-east-1"
   }
}
