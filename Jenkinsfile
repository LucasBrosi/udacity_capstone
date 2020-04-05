pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'echo "next step will be linting"'
        sh 'tidy -q -e *.html'
        sh 'echo "Linting complete"'
      }
    }

  }
}