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
                    sshagent(['build-server-key']) {
                    echo "Packaging the code"
    sh "scp server-script.sh ec2-user@172.31.0.252:/home/ec2-user"
    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.0.252 'bash ~/remote-server.sh'"
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