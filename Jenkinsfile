pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'pylint --disable "C0103" app.py'
        sh 'echo "Linting complete"'
      }
    }

  }
}