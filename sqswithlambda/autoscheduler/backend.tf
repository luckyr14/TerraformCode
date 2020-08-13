terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "stglambda/autoscheduler"
	region = "us-east-1"
   }
}
