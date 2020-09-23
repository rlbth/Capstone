echo "Updating Cloudformation stack ..."
aws cloudformation update-stack --stack-name udacityCapstone --region us-east-2 --template-body file://infrastructure.yaml