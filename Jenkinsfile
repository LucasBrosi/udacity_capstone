pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'pylint "app.py"'
        sh 'echo "Linting complete"'
      }
    }

  }
}