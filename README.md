Udacity Capstone Project

The aim of this project is to setup, deploy and execute a highly scalable application on AWS with IAC
The following steps are part of this project:
1. Using GIT for source code .
2. Storing images in docker hub (Image repository).
3. Linting in CI/CD pipeline
4. Building Docker container from Dockerfile
5. Setting up infrastructure for Kubernetes
6. Deploying application to kubernetes cluster
7. Using Blue/Green deployment model

Running this application:
1.Build and run locally 
docker build . -t IMAGE_NAME
docker run IMAGE_NAME

2.Run directly 
docker run -d -p 80:80 lakran21/capstone

3.Build with Jenkins
Use this GitHub repo and it has Jenkinsfile for the pipeline.

4.Build and run remotely without Jenkins 
aws configure
./create_infra.sh
./kube_deploy.sh

5. Manual linting 
hadolint Dockerfile 
pylint app.py 


