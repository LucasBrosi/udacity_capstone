pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'echo "next step will be linting"'
        sh 'tidy -e *.html'
        sh 'echo "Linting complete"'
      }
    }
    stage('Build image') {
      steps {
        sh 'echo "building image"'
        sh 'docker build -t udacityapp .'
        sh 'docker images list'
        sh 'echo "docker image successfully built"'
      }
    }
  stage('Push image') {
      steps {
        sh 'echo "Sart pushing image"'

      }
    }
  stage('set current kubectl context') {
      steps {
        sh 'echo "setting kubectl context"'

      }
    }
  stage('Deploy Container') {
      steps {
        sh 'echo "deploying"'
        
      }
    }      
  }
}