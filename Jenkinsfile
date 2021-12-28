pipeline {
    agent none
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    stages {
        stage('Compile') {
            agent any
            steps {
                script{
                    echo "Compiling the code"
                    git 'https://github.com/preethid/addressbook-1.git'
                    sh 'mvn compile'
                  }
            }
        }
        stage('UnitTest') {
            agent {label 'linux_slave'}
            steps {
                script{
                    echo "Running the test cases"
                    git 'https://github.com/preethid/addressbook-1.git'
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            agent any
            steps {
                script{
                    echo "Packaging the code"
                    sshagent(['build-server-key']) {
        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.0.252 'sudo yum install java-1.8.0-openjdk-devel -y'"
        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.0.252 'sudo yum install git -y'"
        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.0.252 'sudo yum install maven -y'"
        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.0.252 'cd /home/ec2-user/addressbook-1/'"
        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.0.252 'mvn package'"
        
      }
                  }
            }
        }
        stage('Deploy') {
            agent any
           steps {
                script{
                    echo "Deploying the app"
                  }
            }
        }
    }
}