pipeline {
    agent {
        label 'terraform'
    }

    stages {
        stage('GIT CHECKOUT') {
            steps {
                echo 'checking out git repo..'
                git branch: 'main', url: 'https://github.com/james-cole2015/animated-bassoon.git'
            }
        } 
        stage('TERRAFORM INIT') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: "terraform-jenkins",accessKeyVariable: 'AWS_ACCESS_KEY_ID',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform init'
                    echo 'intializing terraform..'
}
            }
        }
        stage('TERRAFORM PLAN') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: "terraform-jenkins",accessKeyVariable: 'AWS_ACCESS_KEY_ID',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    echo 'saving terraform plan'
                    sh 'terraform plan -out=plan.out'
}
            }
        }
        stage('TERRAFORM APPLY') {
            steps {
                echo 'deploying changes in terraform..'
                sh 'terraform apply --auto-approve -no-color'
            }
        }
    }   
}