pipeline {
    agent any

    stages {
        stage("checkout") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-ssh', url: 'git@github.com:mhinkyu/Terraform-pipeline.git']]])
            }
        }
        stage("Download Terraform") {
            steps {
                sh '''sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
sudo apt-get install wget
sudo wget https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip
sudo apt-get install unzip
sudo unzip terraform_1.3.3_linux_amd64.zip
sudo mv terraform /usr/local/bin/
sudo apt-get update
'''
            }
        }
        stage("Ansible install") {
            steps {
                sh '''sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible'''
            }
        }
        stage("Terrafrom init") {
            steps {
                sh '''sudo terraform init
sudo terraform apply -auto-approve'''
            }
        }
        
    }
}