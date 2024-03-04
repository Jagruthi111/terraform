pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

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
                input message: 'Apply Terraform plan?', ok: 'Yes'
                sh 'terraform apply -input=false tfplan'
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
