terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "stglambda/thumbnail"
	region = "us-east-1"
   }
}
