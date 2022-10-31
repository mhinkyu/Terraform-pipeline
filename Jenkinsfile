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
                sh '''apt-get update && apt-get install -y gnupg software-properties-common
apt-get install wget
wget -O- https://apt.releases.hashicorp.com/gpg | \\
gpg --dearmor | \\
tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \\
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \\
tee /etc/apt/sources.list.d/hashicorp.list
apt update
apt-get install terraform'''
            }
        }
        stage("Ansible install") {
            steps {
                sh '''apt-add-repository ppa:ansible/ansible
apt update
apt install ansible'''
            }
        }
        stage("Terrafrom init") {
            steps {
                sh '''terraform init
terraform apply -auto-approve'''
            }
        }
        
    }
}