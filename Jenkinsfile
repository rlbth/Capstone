pipeline {
    agent any
    stages {
        stage('Lint HTML') {
            steps {
		sh 'echo "Linting HTML ..."'
                sh 'tidy -q -e *.html'
            }
        }
	    
	stage('Docker Build') {
   	    steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]){
		    sh 'echo "Build the image"'
     	    	    sh 'docker build -t lakran21/capstone .'
		}
            }
        }
	    
	stage('Push Image To Dockerhub') {
   	    steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]){
		    sh 'echo "Push the image"'
     	    	    sh '''
                        docker login -u $USERNAME -p $PASSWORD
			docker push lakran21/capstone
                    '''
		}
            }
        }
	 

	    
}
}
