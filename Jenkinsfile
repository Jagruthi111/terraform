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
                 sh 'rm -rf terraform'
                sh 'git clone "https://github.com/Jagruthi111/terraform.git"'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'aws s3 cp s3://backend-bucket567/state.tfstate '
                sh 'terraform init -reconfigure'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            // Clean up
            sh 'terraform destroy -auto-approve'
            sh 'rm -f tfplan'
        }
    }
}
