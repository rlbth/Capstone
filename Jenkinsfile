pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "Hadolint Linting..."'
        sh 'hadolint Dockerfile'
        sh '''echo "Pylint Linting.---"
'''
        sh 'pip install -r requirements.txt'
        sh '''pylint --disable=R,C,W1203,W1201 app.py
'''
      }
    }

    stage('Docker Build') {
      steps {
        sh '''echo "Building ....."
whoami'''
        sh 'docker build . -t lakran21/capstone'
      }
    }

    stage('Push Image To Dockerhub') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
          sh 'echo "Push the image"'
          sh ''' docker login -u $USERNAME -p $PASSWORD
                    '''
        }

        sh '''docker push lakran21/capstone
'''
      }
    }

    stage('B_Cloudformation') {
      parallel {
        stage('B_Cloudformation') {
          steps {
            sh '''echo "Deleting and creating infrastructure ..."
aws cloudformation create-stack --stack-name udacityCapstoneBlue --region us-east-2 --template-body file://blue_deployment/infrastructure.yaml
sleep 17m
aws cloudformation create-stack --stack-name udacityCapstoneNodeBlue --region us-east-2 --template-body file://blue_deployment/infrastructure_eksnodes.yaml
sleep 5m


'''
          }
        }

        stage('G_Cloudformation') {
          steps {
            sh '''echo "Deleting and creating infrastructure ..."
aws cloudformation create-stack --stack-name udacityCapstoneGreen --region us-east-2 --template-body file://green_deployment/infrastructure.yaml
sleep 17m
aws cloudformation create-stack --stack-name udacityCapstoneNodeGreen --region us-east-2 --template-body file://green_deployment/infrastructure_eksnodes.yaml
sleep 5m'''
          }
        }

      }
    }

    stage('B_Kubernetes') {
      steps {
        sh '''echo "Starting Kubernetes Deployment ..."
aws eks --region us-east-2 update-kubeconfig --name udacityClusterStaging
kubectl get pods --kubeconfig ./.kube/config
kubectl run udacitycapstonestaging --image=lakran21/capstone:latest
'''
      }
    }

    stage('G_Kubernetes') {
      steps {
        sh '''echo "Starting Kubernetes Deployment ..."
aws eks --region us-east-2 update-kubeconfig --name udacityClusteProduction
kubectl get pods --kubeconfig ./.kube/config
kubectl run udacitycapstoneproduction --image=lakran21/capstone:latest
'''
      }
    }

    stage('Final') {
      steps {
        sh 'echo "Deployment Successful"'
      }
    }

  }
}