terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "stglambda/drawingautolinking"
	region = "us-east-1"
   }
}
