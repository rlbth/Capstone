echo "Creating infrastructure ..."
./delete_infra.sh
./create_infra.sh

echo "Deploying the app ..."
./DeployandRun.sh