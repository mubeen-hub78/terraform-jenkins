pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
    }

    options {
        skipStagesAfterUnstable()
    }

    stages {
        stage('Checkout') {
            steps {
                // CHANGE THIS LINE:
                git url: 'https://github.com/mubeen-hub78/terraform-jenkins.git', branch: 'main' // Assuming 'main' branch
            }
        }

        stage('Terraform Operations') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    sh 'terraform init'
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
