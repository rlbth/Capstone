pipeline {
  agent any
  stages {
    stage('Linting') {
      parallel {
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

        stage('error') {
          steps {
            sh 'whoami'
          }
        }

      }
    }

    stage('Docker Build') {
      steps {
        sh 'echo "Building ....."'
        sh 'docker build . -t lakran21/capstone:0.1'
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