pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        echo "start to lint"
        echo "next step will be linting"
        tidy -e *.html
        echo "Linting complete"
      }
    }
    stage('Build image') {
      steps {
        echo "building image"
        sh 'docker build -t udacityapp .
        docker images list
        echo "docker image successfully built
      }
    }
  stage('Push image') {
      steps {
        echo "Start pushing image
                  
      }
    }
  stage('set current kubectl context') {
      steps {
        echo "setting kubectl context"

      }
    }
  stage('Deploy Container') {
      steps {
        echo "deploying"
        
      }
    }      
  }
}