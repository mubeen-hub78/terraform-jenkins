pipeline {
    agent any

    environment {
        // Securely access AWS keys from Jenkins credentials
        AWS_ACCESS_KEY_ID     = credentials('AWS-ROOT')
        AWS_SECRET_ACCESS_KEY = credentials('AWS-ROOT')
    }

    tools {
        terraform 'Terraform' // Make sure it's installed and configured in Jenkins
    }

    stages {
        stage('Clone Terraform Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/mubeen-hub78/terraform-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        success {
            echo '✅ Terraform applied successfully.'
        }
        failure {
            echo '❌ Terraform failed. Check logs.'
        }
    }
}
