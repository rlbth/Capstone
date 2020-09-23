echo "Running Cloudformation create stack command ...."
aws cloudformation create-stack --stack-name udacityCapstone --region us-east-2 --template-body file://infrastructure.yaml
