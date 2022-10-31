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
sudo wget -O- https://apt.releases.hashicorp.com/gpg | \\
sudo gpg --dearmor | \\
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \\
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \\
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform'''
            }
        }
        stage("Ansible install") {
            steps {
                sh '''sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible'''
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