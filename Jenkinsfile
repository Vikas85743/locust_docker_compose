pipeline {
  agent any
  stages {
    stage('DockerCompose up') {
      parallel {
        stage('Setup Locust and Prometheus') {
          steps {
            powershell 'docker-compose up -d'
          }
        }

        stage('Start Locust Load test') {
          steps {
            powershell '.\\locust_swarm.ps1'
          }
        }

        stage('Start Grafana') {
          steps {
            powershell './GrafanaSetup.ps1'
          }
        }

      }
    }

  }
}