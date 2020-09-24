echo "Installing Kubernetes..."
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
sudo pip install awscli

echo "Starting Kubernetes Deployment ..."
aws eks --region us-east-2 update-kubeconfig --name udacityCluster
kubectl get pods --kubeconfig ./.kube/config
kubectl run udacitycapstone --image=lakran21/capstone:latest
