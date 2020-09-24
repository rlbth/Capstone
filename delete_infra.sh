echo "Deleting stack ..."
aws cloudformation delete-stack --stack-name udacityCapstone --region us-east-2
aws cloudformation delete-stack --stack-name udacityCapstoneNodes --region us-east-2
