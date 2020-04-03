pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'echo "next step will be linting"'
        sh 'pylint --disable=all app.py'
        sh 'echo "Linting complete"'
      }
    }

  }
}