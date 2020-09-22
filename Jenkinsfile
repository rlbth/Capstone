pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "Hadolint Linting..."'
        sh 'hadolint Dockerfile'
        sh '''echo "Pylint Linting.---"
'''
        sh '''pylint --disable=R,C,W1203,W1201 app.py
'''
      }
    }

    stage('Docker Build') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
          sh 'echo "Build the image"'
          sh 'docker build -t lakran21/capstone .'
        }

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

  }
}