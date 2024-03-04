pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                sh 'git clone "https://github.com/Jagruthi111/terraform.git"'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -autoapprove
            }
        }
    }

    post {
        always {
            // Clean up
            sh 'terraform destroy -auto-approve'
            sh 'rm -f terraform.zip tfplan'
        }
    }
}
