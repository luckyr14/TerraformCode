terraform {
  backend "s3" {
    bucket = "terraform-eks-apollo-state"
    key = "stglambda/drawingocr"
	region = "us-east-1"
   }
}
