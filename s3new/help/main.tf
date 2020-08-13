module "s3client" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/s3newway/module/s3"
	region = "us-east-1"
	env = "dev"
	bucketname = "dev-help-apollo-client"
        s3backendbucket = "terraform-eks-apollo-state"
        s3backendbucketkey = "devclient/help" 
        s3backendbucketregion = "us-east-1" 
}
