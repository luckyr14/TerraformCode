terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "devclient/drawing"
	region = "us-east-1"
   }
}
