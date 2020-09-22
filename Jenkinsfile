pipeline {
  agent any
  stages {
    stage('Build Dockerfile') {
      steps {
        sh 'docker build . -t lakran21/capstone:latest'
      }
    }

  }
}