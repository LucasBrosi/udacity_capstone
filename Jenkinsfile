pipeline {
  agent any
  stages {
    stage('Linting') {
      steps {
        sh 'echo "start to lint"'
        sh 'echo "next step will be linting"'
        sh 'tidy -e *.html'
        sh 'echo "Linting complete"'
        sh 'aws s3 ls'
      }
    }

    stage('Build and push blue image') {
      steps {
        sh 'echo "building image"'
        sh 'docker build --no-cache -t udacityappblue .'
        sh 'docker images list'
        sh 'echo "docker image successfully built"'
        sh 'echo "loging into docker hub"'
        withCredentials([usernamePassword(credentialsId: 'docker_jenkins', passwordVariable: 'passw', usernameVariable: 'usern')]) {
        sh 'docker login -u $usern -p $passw'
        }
        sh 'echo "login ok"'
        sh 'echo "tagging image"'
        sh 'docker tag udacityappblue:latest docker.io/lucasbro/udacityappblue:latest'
        sh 'echo "start pushing blue image"'
        sh 'docker push docker.io/lucasbro/udacityappblue:latest'
        sh 'echo "pushed blue image successfully"'
      }
    }
    stage('Deploy blue version') {
      steps {
            sh 'echo "setting kubectl context and deploying blue version"'
          withAWS(region:'us-east-2', credentials:'AWS_Jenkins') {
            sh 'kubectl config view'
            sh 'kubectl apply -f ./initcontrollerblue.json'
            sleep(time:5,unit:"SECONDS")
            sh 'kubectl apply -f ./controllerblue.json'
            sleep(time:5,unit:"SECONDS")
          	}
      }
    }
    stage('Test blue version') {
      steps {
        sh 'echo "preparing LBTestingEndpoint"'
        sh 'kubectl apply -f ./lbtestingendpoint.json'
        sleep(time:10,unit:"SECONDS")
        sh 'kubectl get svc'
        input "Is the new blue version running properly?"
      }
    }
    stage('Redirect user traffic to blue version') {
      steps {
        sh 'echo "shifting user traffic to blue version"'
        sh 'kubectl apply -f ./shiftservicetoblue.json'
      }
    }

    stage('Build and push green version') {
      steps {
        sh 'echo "building green image"'
        sh 'docker build --no-cache -t udacityappgreen .'
        sh 'docker images list'
        sh 'echo "docker image successfully built"'
        sh 'echo "loging into docker hub"'
        withCredentials([usernamePassword(credentialsId: 'docker_jenkins', passwordVariable: 'passw', usernameVariable: 'usern')]) {
        sh 'docker login -u $usern -p $passw'
        }
        sh 'echo "login ok"'
        sh 'echo "tagging green image"'
        sh 'docker tag udacityappgreen:latest docker.io/lucasbro/udacityappgreen:latest'
        sh 'echo "start pushing green image"'
        sh 'docker push docker.io/lucasbro/udacityappgreen:latest'
        sh 'echo "pushed green image successfully"'
      }
    }

      stage('deploy green version') {
      steps {
        sh 'echo "Refreshing green pods"'
        sh 'kubectl apply -f ./initcontrollergreen.json'
        sleep(time:5,unit:"SECONDS")
        sh 'kubectl apply -f ./controllergreen.json'
        sleep(time:5,unit:"SECONDS")
        sh 'kubectl get svc'
      }
    }

      stage('redirect user traffic to green') {
      steps {
        sh 'echo "shifting user traffic to green"'
        sh 'kubectl apply -f ./shiftservicetogreen.json'
        sleep(time:10,unit:"SECONDS")
        sh 'kubectl get svc'
      }
    }
 
  }
}