module "s3client" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/s3newway/module/s3"
	region = "us-east-1"
	env = "dev"
	bucketname = "dev-insight-apollo-client"
}
