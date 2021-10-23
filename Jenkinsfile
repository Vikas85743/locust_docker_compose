pipeline {
  agent any
  stages {
    stage('DockerCompose up') {
      parallel {
        stage('DockerCompose up') {
          steps {
            powershell 'docker-compose up -d'
          }
        }

        stage('Run Duration') {
          steps {
            sleep 300
            powershell 'docker-compose down'
          }
        }

      }
    }

  }
}