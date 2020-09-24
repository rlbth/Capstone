echo "Running Cloudformation create stack command ...."
aws cloudformation create-stack --stack-name udacityCapstone --region us-east-2 --template-body file://infrastructure.yaml
aws cloudformation create-stack --stack-name udacityCapstoneNodes --region us-east-2 --template-body file://infrastructure_eksnodes.yaml
