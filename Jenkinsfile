pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'echo "next step will be linting"'
        sh 'tidy *.html'
        sh 'echo "Linting complete"'
      }
    }

  }
}